class User < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: ["600", :png] }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  #validates_with AttachmentPresenceValidator, attributes: :photo

  attr_accessor :delete_photo
  before_validation { photo.clear if delete_photo == '1' }

  after_create do
    User.send_welcome_email(self.id)
  end

  
  def self.send_welcome_email(user_id)
    user = User.find_by_id(user_id)
    UserMailer.welcome(user).deliver
  end

end
