class User < ActiveRecord::Base
  after_create :welcome_email
  has_attached_file :photo, :styles => { :thumb => "100x100" }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def welcome_email
    UserMailer.welcome(self).deliver!
  end
end
