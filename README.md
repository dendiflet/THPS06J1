### salut ho grand correcteur

petit readme dégeulasse pour dire :

petite musique habituelle :
`git clone`
`bundle instal`
`rails db:create db:migrate`


si tu veux faire un petit `rspec` des famille, fait toi plaisir
normalement les trois modèles sont testé (23/23 ok <- fier)

`rails c` t'amenera dans la console


pour vérifier le Mailer,
connecte toi sur http://www.yopmail.com/

créer un user dans la console, voici le modèle
`user = User.create!(first_name: "first_name", last_name: "last_name", email: "mail@yopmail.com")`

un email devrait apparaitre dans yopmail



pour créer un event, voici un modèle :

attention, il faut mettre un _user.id_ en admin, sinon tu va te faire jetter par le model (dernier attribut dans le bloc)

`event = Event.create!(title: "diner",description: "la bonne bouffe a VB",start_date: "17/02/2019",duration: "90" ,price: "5" ,location: "V-B" ,admin_id: ici_un_user_existant_stp.id )`

te voila avec un évenement créer par le user de ton choix !

il y a un user qui est admin par event
donc possibilité de faire
`@user.created_event`
pour trouver les evenement créer par cet user (et la réciproque )

si il te prennait l'envie de faire `user.destroy`,
l'évenement associé devrait aussi disparaitre, tu peux vérifier avec un 
`tp Event.all`




bon sinon, pour ajouter des participant....
faut faire ce genre de choses comme c'est la join_table
`Attendance.create!(user_id: 1, event_id: 1)`



mais a la mains c'est long donc peut-etre il serait temps de faire un 
`rails db:drop db:create db:migrate db:seed`  non?

avec le seed :
-7 personnes crées, 
-un évenement lié a la première personne (l'home de paille/crashtest) 
-et trois participants

normalement, si j'ai le temps cette nuit et que tout va bien, viennent d'etre inscrit trois personne au seul évenement crée, voici leurs mails : 
mail@yopmail.com
yaya38@yopmail.com
rory38@yopmail.com



pour la suite des tests, je te laisse faire


j'espère que ca t'a plus.

























travail fait en équipe de 1 !




