class User < ApplicationRecord
  after_create :send_welcome_email

  has_attached_file :profile_photo, styles: { medium: "300x300", thumb: "100x100" }

  validates_with AttachmentContentTypeValidator, attributes: :profile_photo, content_type: /\Aimage\/.*\Z/

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end
end
