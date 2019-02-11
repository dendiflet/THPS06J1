class User < ApplicationRecord

# ho, tout en minuscule ;-)
  before_save { self.email = email.downcase }

# magie noire pour le format de l'email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :first_name, 
	  presence: true

	validates :last_name, 
	  presence: true

  validates :email, 
    presence: true, 
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    has_many :attendances, dependent: :destroy
    has_many :events, dependent: :destroy


end
