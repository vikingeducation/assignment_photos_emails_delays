class User < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumb => "100x100" }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def self.welcome_email(user_id)
    user = User.find(user_id)
    UserMailer.welcome(user).deliver!
  end
end
