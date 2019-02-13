class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :update, :new, :create]

#  before_action :is_admin?, only: [:edit]

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
    puts "@"*60
    puts "ici la page show d'un event"
    puts "@"*60    
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
      puts "@"*60
      puts "evenement créé"
      puts "@"*60
      #flash[:success] = "Compte créé !"
      redirect_to event_path(@event)  #faudrait rediriger ailleurs
    end
  end



  def edit
    post_prams = params.permit(:id)
    @user = current_user
    @one_event = Event.find_by(id: params[:id])


  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end


end
