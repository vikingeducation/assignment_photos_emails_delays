class User < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300", thumb: "100x100"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def photo_data=(photo_data)
    self.data      = photo_data.read
    self.filename  = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end


end
