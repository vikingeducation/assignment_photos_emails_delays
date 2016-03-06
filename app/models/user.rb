class User < ActiveRecord::Base

  def photo_blob=(photo_blob)
    self.blob_data = photo_blob.read
    self.blob_content_type = photo_blob.content_type
  end
end
