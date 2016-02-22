class User < ActiveRecord::Base

  def profile_photo_data=(profile_photo_data)
    self.profile_photo = profile_photo_data.read
  end

end
