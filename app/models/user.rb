class User < ApplicationRecord

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # private
    def self.send_welcome_email(id)
      user = User.find(id)
      UserMailer.welcome(user).deliver
    end
    # handle_asynchronously :send_welcome_email

  # def photo=(photo)
  #   self.photo_data = photo.read
  #   self.photo_filename = photo.original_filename
  #   self.photo_mimetype = photo.content_type
  # end
end
