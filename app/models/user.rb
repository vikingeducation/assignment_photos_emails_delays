class User < ApplicationRecord
  # virtual attributes for User photo
  def user_photo=(user_photo)
    self.photo_data = user_photo.read
    self.photo_filename = user_photo.original_filename
    self.photo_mime_type = user_photo.content_type
  end
end
