class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


# ajout des quatres alertes principale en bootstrap (3autres manquantes)
  add_flash_types :danger, :info, :warning, :success

private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def is_admin?
    puts "@"*60
    puts "admin?"
    post_params = params.permit(:id)
    event = Event.find_by(id: params[:id])
    @user.id == event.admin_id

  end 

  def already_subscribed?
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    puts "@"*60
    puts "déja inscrit?"
    if @event.attendances.find_by(user_id: current_user.id) != nil
      return true
    else
      return false
    end
  end

  def can_subscribe_for_event?
    puts "@"*60
    puts "pas admin et pas inscrit ?" 
    if is_admin? || already_subscribed?
      return false
    else
      return true
    end
  end

end
