class User < ApplicationRecord

  has_attached_file :profile_photo, styles: {medium: "300x300"}
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

end
