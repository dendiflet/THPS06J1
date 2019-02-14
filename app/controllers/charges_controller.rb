class ChargesController < ApplicationController
def new
end

def create
  # Amount in cents
  @amount = 500
   
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



  ###########@ a enregistrer dans attendances  
  @a = customer.id
  # @b = Stripe::Customer.retrieve(@a)[:id]
  ###########################################

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path(id: @event_id)

  # @user = current_user
  # params.permit(:event)
  # @event_id = params[:event]

    @rec = Attendance.create(user_id: @user.id, event_id: @event_id, stripe_customer_id: @a)
    @rec.save!
    flash[:succes] = "tu est bien inscrit a l'évenement"
    redirect_to controller: 'attendances', action: 'create', id: @event_id, attendance_to_save: @rec
  end 

end
