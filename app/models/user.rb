class User < ActiveRecord::Base

  def profile_photo=(profile_photo)
    self.data      = profile_photo.read
    self.filename  = profile_photo.original_filename
    self.mime_type = profile_photo.content_type
  end

end
