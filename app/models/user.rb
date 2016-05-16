class User < ActiveRecord::Base

  #after_create :send_welcome_email

  has_attached_file :avatar,
            :source_file_options => {all: '-rotate 90'},
            :styles => { :medium => "300x300", :thumb => "100x100" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  attr_accessor :delete_avatar
  before_validation { avatar.clear if delete_avatar == '1' }


  def profile_photo=(profile_photo)
    self.profile_photo_data = profile_photo.read
    self.profile_photo_file_name  = profile_photo.original_filename
    self.profile_photo_mime_type = profile_photo.content_type
  end

  def self.send_welcome_email(user_id)
    UserMailer.welcome(User.find(user_id)).deliver!
  end
  
  def send_welcome_email
    User.send_welcome_email(self.id)
  end   

  ###
end
