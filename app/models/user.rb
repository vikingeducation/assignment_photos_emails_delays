class User < ActiveRecord::Base

  has_attached_file :avatar
  after_create :queue_welcome_email

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def queue_welcome_email
  	User.delay.send_welcome_email(id)
  end

  def self.send_welcome_email(user_id)

  	UserMailer.welcome(User.find(user_id)).deliver_now!

  end


end
