class User < ApplicationRecord
  # This should be in a photo model but for demonstration purposes, it is in the user model
   # Using VIRTUAL ATTRIBUTES to set our photo
  # 
  # This works because the temp photo is passed in 
  #   from our form under the `photo_data` key,
  #   which expects a `photo_data=` setter to
  #   be present in our model when we call `new` on it.
  # We have just made that setter do a bit more
  #   than usual since it needs to process the
  #   data with the `read` method *and* parse out
  #   some additional attributes as part of the save.
  def photo_data=(photo_data)
    self.data      = photo_data.read
    self.filename  = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end
end
