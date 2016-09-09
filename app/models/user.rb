class User < ApplicationRecord

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  # You'll want to make sure you've whitelisted only acceptable
  # content types to avoid attacks
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  def self.send_welcome_email(id)
    user = User.find(id)
    # Note that the bang (!) method will blow
    # up (roll back) the save transaction on failure
    FunMailer.welcome(user).deliver!

  end


end
