class User < ActiveRecord::Base

  has_attached_file :avatar
  # after_create :send_welcome_email

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  private

  def send_welcome_email
  	UserMailer.welcome(self).deliver_now!
  end

end
