class Event < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :start_date, presence: true
	validates :duration, presence: true
	validates :price, presence: true
	validates :location, presence: true

  #has_many :attendances, dependent: :destroy
  belongs_to :user


end
