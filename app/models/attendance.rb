class Attendance < ApplicationRecord

	belongs_to :user
	belongs_to :event

#################### MAILER ################

  after_create :more_participant_send

  def more_participant_send
  	
    UserMailer.more_participant_email(event, event.admin, user).deliver_now
  end

###############################################


end
