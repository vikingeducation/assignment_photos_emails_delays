class User < ActiveRecord::Base



  def profile_photo=(photo)
    self.data = photo.read
    self.filename = photo.original_filename
    self.mime_type = photo.content_type
  end
end
