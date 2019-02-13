class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# ho, tout en minuscule ;-)
  before_save { self.email = email.downcase }

# magie noire pour le format de l'email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, 
    presence: true, 
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

    has_many :attendances, dependent: :destroy
    has_many :events, through: :attendances




    has_many :created_events, class_name: "Event", foreign_key: 'admin_id', dependent: :destroy 

#################### MAILER ################

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
###############################################






end
