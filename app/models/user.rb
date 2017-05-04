class User < ApplicationRecord

  # after_create :send_welcome_email
  # def photo_data=(photo_data)
  #   self.profile_photo = photo_data.read
  #   self.filename = photo_data.original_filename
  #   self.mime_type = photo_data.content_type
  # end

  # for activejob
   after_create :queue_welcome_email


  has_attached_file :profile_photo,
    styles: { :medium => "500x500>", :thumb => "120x90#" },
    default_url:  ":style_missing.png"

  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_profile_photo

  before_validation { profile_photo.clear if delete_profile_photo == '1' }



  # method when not using activejob
  # def self.send_welcome_email(user)
  #   user = User.find(user)
  #   UserMailer.welcome(user).deliver
  # end


  private

  # for activejob
  def queue_welcome_email
    UserMailer.welcome(self).deliver_later
  end

    def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

end
