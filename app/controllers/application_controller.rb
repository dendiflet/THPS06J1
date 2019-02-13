class ApplicationController < ActionController::Base

  def is_admin?
    puts "@"*60
    puts "admin?"
    puts "@"*60
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])
    @user.id == event.admin_id

  end 

  def already_subscribed?
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    puts "@"*60
    puts "déja inscrit?"
    puts "@"*60 
    if @event.attendances.find_by(user_id: current_user.id) != nil
      return true
    else
      return false
    end
  end

  def can_subscribe_for_event?
    puts "@"*60
    puts "pas admin et pas inscrit"
    puts "@"*60    
    if is_admin? || already_subscribed?
      return false
    else
      return true
    end
  end



# def can_subscribe_to_event?
#   not_admin? && !not_participant?
# end



# def not_admin?
#     post_params = params.permit(:id)
#     #prend l'user actuel
#     @user = current_user
#     #prend l'evenement 
#     @event = Event.find_by(id: params[:id])
#     #true == not admin
#     @user.id != @event.admin_id
# end


#   def not_participant?
#     # get event id permited
#     post_params = params.permit(:id)
    
#     # get all subscribed event by the current user
#     @user = current_user
#     @all_subscribed = Attendance.all.find_by(user: @user )

#     # get all participants for the selected event
#     @all_participants = Attendance.all.find_by(event_id: params[:id])

#     if @all_participants == nil
#       return false
#     elsif @all_participants != nil && @all_participants.length == 1
#       return false
#     else
#       # look into participants if user already subscrybed
#       @all_participants.find_by(user_id: @user.id)
#     end
#   end


end
