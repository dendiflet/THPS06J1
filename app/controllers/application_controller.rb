class ApplicationController < ActionController::Base

  def is_admin?
    post_params = params.permit(:id)
    @one_event = Event.find_by(id: params[:id])
    @user.id == @one_event.admin_id
  end 


# def can_subscribe_to_event?
# 	not_admin? && !not_participant?
# end

# def not_admin?
#     post_params = params.permit(:id)
#     #prend l'user actuel
# 	  @user = current_user
# 	  #prend l'evenement 
#     @event = Event.find_by(id: params[:id])
#     #true == not admin
#     @user.id != @event.admin_id
# end


# 	def	not_participant?
# 		# get event id permited
# 		post_params = params.permit(:id)
	  
# 	  # get all subscribed event by the current user
# 	  @user = current_user
# 	  @all_subscribed = Attendance.all.find_by(user: @user )

# 	  # get all participants for the selected event
# 		@all_attendances_for_event = Attendance.all.find_by(event_id: params[:id])

# 		if @all_participants == nil
# 			return false
# 		elsif @all_participants == nil && @all_participants.length == 1
# 			return false
# 		else
# 	    # look into participants if user already subscrybed
# 		  @all_attendances_for_event.find_by(user_id: @user.id)
# 	  end
#   end

  def is_user_new_for_event?
  	post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
		current_user != @event.admin && current_user != @event.attendances.find_by(user_id: current_user.id)
  end

end
