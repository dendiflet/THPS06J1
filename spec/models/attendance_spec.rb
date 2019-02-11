require 'rails_helper'

RSpec.describe Attendance, type: :model do

# clean all the mess before pls
User.destroy_all
Event.destroy_all
Attendance.destroy_all

  before(:each) do
		@valid_user = User.create!(
			first_name: "first_name", 
			last_name: "last_name", 
			email: "mail@yopmail.com"
			)

		@valid_event = Event.create!(
			title: "diner",
			description: "la bonne bouffe a VB",
			start_date: "17/02/2019",
			duration: "90" ,
			price: "5" ,
			location: "V-B" ,
			admin_id: @valid_user.id)
		
		@valid_attendance = Attendance.create!(
			user: @valid_user,
			event: @valid_event			
			)
	end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_attendance).to be_a(Attendance)
			expect(@valid_attendance).to be_valid
		end

  end

end
