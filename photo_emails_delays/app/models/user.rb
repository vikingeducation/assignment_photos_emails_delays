class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "100x100"}
  validates_attachment_content_type :avatar ,
                                   :content_type => /\Aimage\/.*\Z/

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end
end
