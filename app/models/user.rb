class User < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: ["150", :png] }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentPresenceValidator, attributes: :photo

  attr_accessor :delete_photo
  before_validation { photo.clear if delete_photo == '1' }

  

end
