class AttendancesController < ApplicationController

  def index
  end

  def show
    @user = current_user
    @event_owned = @user.created_events
  end

  def new
    post_params = params.permit(:event)
    @event = Event.all.find_by(id: params[:event])
    @new_inscription_to_the_event = Attendance.new
    @user = current_user
    puts "@"*60
    puts "ici la page d'inscription"
    puts "@"*60
  end

  def create 
    @event     
    @user = current_user
    @new_attendance.user_id = current_user.id
    @new_attendance.event_id = params(:format)
    puts "@"*60
    puts "bientot ton enregistrement a l'evenement"    
    puts "@"*60
    if @new_attendance.save!
      puts "@"*60
      puts "inscrit"
      puts "@"*60
      redirect_to event_path(@event.id)
    else
      puts "@"*60
      puts "ici la page show d'un event"
      puts "@"*60
      redirect_to root_path
    end
  end

end
