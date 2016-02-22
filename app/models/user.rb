class User < ActiveRecord::Base

  has_attached_file   :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  def photo_data=(new_data)
    self.profile_photo = new_data.read
    self.filename  = new_data.original_filename
    self.mime_type = new_data.content_type
  end

end
