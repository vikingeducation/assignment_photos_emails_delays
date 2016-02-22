class User < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300", thumb: "100x100", text: { quality: :better } }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment :photo, presence: true,
  content_type: { content_type: "image/png" },
  size: { in: 0..100.kilobytes }

  def photo_data=(photo_data)
    self.data      = photo_data.read
    self.filename  = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end


end
