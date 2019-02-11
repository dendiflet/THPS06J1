require 'rails_helper'


RSpec.describe User, type: :model do


  before(:each) do
		@valid_user = User.create!(
			first_name: "first_name", 
			last_name: "last_name", 
			email: "mail@yopmail.com"
			)
	end

	context "validation" do

		it "is valide with valide attributes" do
			expect(@valid_user).to be_a(User)
			expect(@valid_user).to be_valid
		end

		describe "#first_name" do
      it "should not be valid whitout first_name" do
				@invalid_blank_fn_user = User.create(
					last_name: "last_name", 
					email: "mail@opmail.com"
					)
        expect(@invalid_blank_fn_user).not_to be_valid
      end
    end

    describe "#last_name" do
      it "should not be valid whitout last_name" do
				@invalid_blank_ln_user = User.create(
					first_name: "first_name", 
					email: "mail@ypmail.com"
					)
        expect(@invalid_blank_ln_user).not_to be_valid
      end
    end


    describe "#email" do
      it "should not be valid without email" do
        @invalid_blank_email_user = User.create(
					first_name: "first_name", 
					last_name: "last_name", 
					) 
        expect(@invalid_blank_email_user).not_to be_valid
      end
    end


    describe "#email" do
      it "should not be valid with wrong email" do
				@invalid_mail_user1 = User.create(
					first_name: "first_name", 
					last_name: "last_name", 
					email: "mailyopmail.com"
					)        
				expect(@invalid_mail_user1).not_to be_valid
      end
    end

    describe "#email" do
      it "should not be valid with wrong email" do
				@invalid_mail_user2 = User.create(
					first_name: "first_name", 
					last_name: "last_name", 
					email: "mail@yopmailcom"
					)        
				expect(@invalid_mail_user2).not_to be_valid
      end
    end
  end
end
