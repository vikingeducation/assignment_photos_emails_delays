class User < ApplicationRecord
  has_attached_file :profile_photo, styles: { medium: "300x300", thumb: "100x100" }

  validates_with AttachmentContentTypeValidator, attributes: :profile_photo, content_type: /\Aimage\/.*\Z/

  private

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end
end
