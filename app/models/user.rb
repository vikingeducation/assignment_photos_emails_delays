class User < ApplicationRecord
  # def photo_data=(photo_data)
  #   self.profile_photo = photo_data.read
  #   self.filename = photo_data.original_filename
  #   self.mime_type = photo_data.content_type
  # end

  has_attached_file :profile_photo,
    styles: { :medium => "500x500>", :thumb => "120x90#" },
    default_url:  ":style_missing.png"

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_profile_photo

  before_validation { profile_photo.clear if delete_profile_photo == '1' }


end
