class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => {
    :medium => "300x300", :thumb => "100x100"
  }
  # You'll want to make sure you've whitelisted only acceptable
  # content types to avoid attacks
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # For saving profile photo file information into our database.
  # No need for this if not saving profile photo into our own database.
  def photo_data=(photo_data)
    self.data = photo_data.read
    self.filename = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end

  def self.send_welcome_email(user_id)
    # Note that the bang (!) method will blow up
    # (roll back) the save transaction on failure. 
    UserMailer.welcome(User.find(user_id)).deliver!
  end

end
