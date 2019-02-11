class Event < ApplicationRecord

	validates :title, 
		presence: true, 
    length: { in: 5..140 }

	validates :description, 
		presence: true, 
    length: { in: 20..1000 }


	validates :start_date,
		presence: true


	validates :duration, 
		presence: true,
		numericality: { only_integer: true}

	validates :price, 
		presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }


	validates :location, 
		presence: true

  has_many :attendances, dependent: :destroy
  belongs_to :admin, class_name: "User"


# methode intéressantes pour plus tard?
#  scope :in_the_past, { where('start_date < ?', Time.now }
#  scope :in_the_future, { where('start_date > ?', Time.now 


  validate :duration_format_ok
	def duration_format_ok
	  if duration.present? &&	duration%5 != 0
			errors.add(:duration_format, "puts correct duration format")
		end

	end

	validate :is_future
	def is_future
		if start_date.present? && start_date < Time.now
			errors.add(:expiration_date, "can't be in the past")
		end
	end



# charles a proposé ca mais ca fonctionne pas bien
# 	validates :is_started_date_ok?, presence: true
# 	def is_started_date_ok?
# 	  if start_date < Time.now
# 	    errors.add(:start_date, 'Le début de l\'événement ne peux être dans le passé!')
# 	  end
# 	end

end
