class User < ActiveRecord::Base
  after_create :send_welcome_email

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def profile_photo_data=(profile_photo_data)
    self.profile_photo = profile_photo_data.read
  end

private

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end
  #Not clear on what the ! is doing here.

end
