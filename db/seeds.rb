# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


# petit clean de db
User.destroy_all
Event.destroy_all
Attendance.destroy_all


#create 5 users from same house + the test user

@valid_user = User.create!(first_name: "first_name", last_name: "last_name", email: "mail@yopmail.com")


User.create!(
	first_name: "yaya", 
	last_name: "timbre", 
	email: "yaya38@yopmail.com"
	)

User.create!(
	first_name: "rory", 
	last_name: "kiwi", 
	email: "rory38@yopmail.com"
	)

User.create!(
	first_name: "loulou", 
	last_name: "steezy", 
	email: "steezy38@yopmail.com"
	)

User.create!(
	first_name: "gaelle", 
	last_name: "mamie", 
	email: "mamie38@yopmail.com"
	)

User.create!(
	first_name: "nico", 
	last_name: "lostesso", 
	email: "lostesso38@yopmail.com"
	)

User.create!(
	first_name: "louisa", 
	last_name: "taketrainsfornoobs", 
	email: "louisa38@yopmail.com"
	)


# saturday nigth diner fever at V-B créer par yaya user_id = 1
Event.create!(title: "diner",description: "la bonne bouffe a VB",start_date: "17/02/2019",duration: "90" ,price: "5" ,location: "V-B" ,user_id: "1")


# inscription des 3 premières personnes de la table, les deux autres inscriptions possible sont laissées vacantes pour les tests consoles
Attendance.create!(user_id: 1, event_id: 1)
Attendance.create!(user_id: 2, event_id: 1)
Attendance.create!(user_id: 3, event_id: 1)



