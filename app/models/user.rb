class User < ActiveRecord::Base

  has_attached_file :profile_photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :profile_photo, :less_than => 2.megabytes


  # after_create self.send_welcome_email


  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver!
  end

end
