class User < ApplicationRecord
  after_create :send_welcome_email

  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_avatar

  before_validation { avatar.clear if delete_avatar == '1' }

  private

    def send_welcome_email
      #Note that the ! method will roll back the save transaction on failure
      UserMailer.welcome(self).deliver!
    end

end