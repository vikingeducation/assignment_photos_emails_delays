class User < ActiveRecord::Base
attr_accessor :avatar
has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100"}
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  # def profile_photo=(profile_photo)
  #   self.data = profile_photo.read
  #   self.filename = profile_photo.original_filename
  #   self.mime_type = profile_photo.content_type
  # end
end
