class User < ApplicationRecord

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  after_create :queue_welcome_email

  private
    def queue_welcome_email
      UserMailer.welcome(self).deliver_later
    end

  # def photo=(photo)
  #   self.photo_data = photo.read
  #   self.photo_filename = photo.original_filename
  #   self.photo_mimetype = photo.content_type
  # end
end
