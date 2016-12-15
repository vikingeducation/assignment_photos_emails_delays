class User < ApplicationRecord
  def photo=(photo)
    self.photo_data = photo.read
    self.photo_filename = photo.original_filename
    self.photo_mimetype = photo.content_type
  end
end
