class AttendancesController < ApplicationController

  def index
    post_params = params.permit(:event)
    @user = current_user
    @event = Event.find_by(id: params[:event])
    @admin = @user.id == @event.admin_id
    @paticipants_group = Attendance.where(event_id: params[:event])    
  end

  def show
    @user = current_user
    @event_owned = @user.created_events
  end

  def new
    post_params = params.permit(:event)
    @event = Event.find_by(id: params[:event])
    @user = current_user
  end

  def create
    params.permit(:event)


    @event = Event.find(params[:event])
    @amount = (@event.price) * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

    @attendance = Attendance.new(stripe_customer_id: charge[:customer], event_id: @event.id, user_id: current_user.id)

    if @attendance.save 
      flash[:success] = "Vous êtes bien inscrit à l'événement !"
      redirect_to event_path(@event.id)
    else
      render 'new'
    end

  end




end
