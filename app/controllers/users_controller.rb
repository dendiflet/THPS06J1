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
    flash[:success] = "Ton profil a bien été maj !"

  end

  def update
    flash[:success] = "Ton profil a bien été maj !"
  end

  def destroy
  end
end
