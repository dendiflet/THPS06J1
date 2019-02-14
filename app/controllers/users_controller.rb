class UsersController < ApplicationController

# before_action :is_admin?, only: [:show, :edit]  

  def index
  end

  def show
    @user = current_user
    @event_owned = @user.created_events
  end

  def new
    # géré par devise
  end

  def create
  end

  def edit
    @user = current_user    


  end

  def update
    edit_params = params.require(:user).permit(:description, :first_name, :last_name)
    posted_params = params.permit(:user)
    @user = User.find_by(id: current_user.id)
    byebug
    if @user.update(edit_params)
    flash[:success] = "Ton profil a bien été maj !"
    redirect_to root_path
    else
      flash[:warning] = "Essaye encore!" 
      render :edit
    end
  end

  def destroy
  end
end
