class User < ActiveRecord::Base
  has_attached_file :profile_photo

  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/

  private

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end
end
