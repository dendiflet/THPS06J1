require 'rails_helper'




RSpec.describe Event, type: :model do

# clean de la db svp !
User.destroy_all
if Event.all == nil
Event.destroy_all
end



  before(:each) do
		@valid_user = User.create!(
			first_name: "first_name", 
			last_name: "last_name", 
			email: "mail@yopmail.com"
			)

		@valid_event = Event.create!(
			title: "diner",
			description: "la bonne bouffe a VB",
			start_date: Time.now + 1.day,
			duration: 90 ,
			price: 5 ,
			location: "V-B" ,
			user_id: @valid_user.id)
	end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_event).to be_a(Event)
			expect(@valid_event).to be_valid
		end

		describe "#title" do
      it "should not be valid whitout a title" do
			@invalid_event = Event.create(
				description: "la bonne bouffe a VB",
				start_date: "17/02/2019",
				duration: "90" ,
				price: "5" ,
				location: "V-B" ,
				user_id: "1")
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#description" do
      it "should not be valid whitout a description" do
			@invalid_event = Event.create(
					title: "diner",
					start_date: "17/02/2019",
					duration: "90" ,
					price: "5" ,
					location: "V-B" ,
					user_id: "1")
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#start_date" do
      it "should not be valid without a start_date" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					duration: "90" ,
					price: "5" ,
					location: "V-B" ,
					user_id: "1") 
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#duration" do
      it "should not be valid without a duration" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					price: "5" ,
					location: "V-B" ,
					user_id: "1")        
				expect(@invalid_event).not_to be_valid
      end
    end

    describe "#price" do
      it "should not be valid without a price" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					duration: "90" ,
					location: "V-B" ,
					user_id: "1")        
				expect(@invalid_event).not_to be_valid
      end
    end

    describe "#location" do
      it "should not be valid without a location" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					duration: "90" ,
					price: "5" ,
					user_id: "1")        
				expect(@invalid_event).not_to be_valid
      end
    end

    describe "#user_id" do
      it "should not be valid without a creator" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					duration: "90",
					price: "5",
					location: "V-B",)
				expect(@invalid_event).not_to be_valid
      end
    end

############################ missing attribute ##########@



    describe "#price" do
      it "should not be valid without price < 1" do
        @valid_event.price = 0
        expect(@valid_event).not_to be_valid
      end
    end

    describe "#price" do
      it "should not be valid without a price > 1000" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					duration: 90,
					price: 1001,
					location: "V-B",
					user: @valid_user) 
				expect(@invalid_event).not_to be_valid
      end
    end


    describe "#start_date" do
      it "should not be valid without a past date (=< Time.now)" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: Time.now - 1.day,
					duration: 90,
					price: 5,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end


    describe "#title" do
      it "should not be valid with title > 140 char" do
			@invalid_event = Event.create(
					title: "a"*141,
					description: "la bonne bouffe a VB",
					start_date: Time.now + 1.days,
					duration: 90 ,
					price: 55,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#title" do
      it "should not be valid with title < 5 char" do
			@invalid_event = Event.create(
					title: "a"*4,
					description: "la bonne bouffe a VB",
					start_date: Time.now + 1.days,
					duration: 90 ,
					price: 55,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#description" do
      it "should not be valid with description < 20 char" do
			@invalid_event = Event.create(
					title: "diner",
					description: "a"*19,
					start_date: Time.now + 5.days,
					duration: 90 ,
					price: 55,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end

    describe "#description" do
      it "should not be valid with description > 1000 char" do
			@invalid_event = Event.create(
					title: "diner",
					description: "a"*1001,
					start_date: Time.now + 1.days,
					duration: 90 ,
					price: 55,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end


    describe "#duration" do
      it "should not be valid with a duration whoose not by 5 divideable" do
			@invalid_event = Event.create(
					title: "diner",
					description: "la bonne bouffe a VB",
					start_date: "17/02/2019",
					duration: 93,
					price: 57,
					location: "V-B" ,
					user: @valid_user) 
        expect(@invalid_event).not_to be_valid
      end
    end
  end
end
