class User < ApplicationRecord

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_avatar

  before_validation { avatar.clear if delete_avatar == '1' }

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver!
  end

end