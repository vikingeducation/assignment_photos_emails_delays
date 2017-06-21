class User < ApplicationRecord

  def photo_data=(photo_data)
    filepath = Rails.root.join( 'public',
                                'uploads',
                                photo_data.original_filename )
    self.profile_photo = filepath
    self.filename = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end

end
