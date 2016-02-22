class User < ActiveRecord::Base

  def photo_data=(new_data)
    self.profile_photo = new_data.read
    self.filename  = new_data.original_filename
    self.mime_type = new_data.content_type
  end

end
