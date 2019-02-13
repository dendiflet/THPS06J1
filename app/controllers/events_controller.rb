class EventsController < ApplicationController

	def index
    @event = Event.all
    @user = current_user
    session[:user] = @user
  end

  def show
        @user = current_user

    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    post_prams = params.permit(:id)
    @one_event = Event.find_by(id: params[:id])
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
      redirect_to root_path  #faudrait rediriger ailleurs
    end
  end



  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
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

# def current_user
#       @user = current_user
# end

end
