class User < ActiveRecord::Base
  has_attached_file :profile_photo

  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/
end
