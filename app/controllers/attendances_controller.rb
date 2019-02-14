class AttendancesController < ApplicationController

  def index
    post_params = params.permit(:event)
    puts "@"*60
    @user = current_user
    @event = Event.find_by(id: params[:event])
    @admin = @user.id == @event.admin_id



    puts "@"*60
    @paticipants_group = Attendance.where(event_id: params[:event])    
  end

  def show
    @user = current_user
    @event_owned = @user.created_events
  end

  def new
    post_params = params.permit(:event)
    @event = Event.find_by(id: params[:event])
#    @new_inscription_to_the_event = Attendance.new
    @user = current_user
  end

  def create 
    @new_attendance = Attendance.new
    params.require(:attendances).permit(:event_id)
    @event = Event.find_by(id: params[:attendances][:event_id])

    @new_attendance.user_id = current_user.id
    @new_attendance.event_id = @event.id

    if @new_attendance.save!
      # penser a mettre un msg flash un jour
      redirect_to event_path(@event.id)
    else
      redirect_to root_path
    end
  end

end
