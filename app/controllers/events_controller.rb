class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :update, :new, :create]

  def actual_user?
    @user = current_user
  end

  def end_date
   @event.start_date + @event.duration
  end

  def index
    @event = Event.all
    @user = current_user
  end

  def show
    @user = current_user
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    @end_date = end_date
    @admin = is_admin?
    @nb_participant = @event.users.length
    @subscriber = can_subscribe_for_event?  
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def create
    @user = current_user
    post_params = params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price)
    @event = Event.new(post_params)
    @event.admin_id = @user.id

    if @event.save!
      flash[:success] = "Evenement créé !"
      redirect_to event_path(@event)  #faudrait rediriger ailleurs
    end
  end

  def edit
    post_prams = params.permit(:id)
    @user = current_user
    @event = Event.find_by(id: params[:id])
  end

  def update
    posted_params = params.permit(:event)
    params.permit(:id)
    @id = params[:id]
        @event_to_update = Event.find_by(id: @id)
    if @event_to_update.update(title: params[:event][:title],description: params[:event][:description],start_date: params[:event][:start_date],duration: params[:event][:duration],price: params[:event][:price],location: params[:event][:location])
      flash[:success] = "Ton évenement a bien été modifié !"
      redirect_to event_path(@id)
    else
      render :edit
    end
  end

  def destroy
    Event.find_by(id: params[:id]).destroy
    flash[:success] = "Ton event a bien été supprimé."
    redirect_to root_path
  end

end



































