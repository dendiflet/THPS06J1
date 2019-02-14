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
    @event_to_update = Event.find_by(id: params[:id])


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
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end


end


  # @gossip_to_update = Gossip.find_by(id:  params[:id])
  #   posted_params = params.require(:gossip).permit(:title, :content)

  # if @gossip_to_update.update(posted_params)
  #   flash[:success] = "Ton gossip a bien été modifié !"
  #   redirect_to gossip_path
  # else
  #   render :edit
  # end



































