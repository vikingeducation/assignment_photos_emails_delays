class User < ActiveRecord::Base

  

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def profile_photo=(photo)
    self.data = photo.read
    self.filename = photo.original_filename
    self.mime_type = photo.content_type
  end


  private


  def self.send_welcome_email(user)
    UserMailer.delay.welcome(user).deliver!
  end
end
