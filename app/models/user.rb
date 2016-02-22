class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def profile_photo=(profile_photo)
    self.profile_photo_data = profile_photo.read
    self.profile_photo_file_name  = profile_photo.original_filename
    self.profile_photo_mime_type = profile_photo.content_type
  end

end
