class User < ApplicationRecord

  # virtual attribute on User for saving files to DB
  def photo_data=(photo_data)
    self.data = photo_data.read
    self.filename = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end

  has_attached_file

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/




end
