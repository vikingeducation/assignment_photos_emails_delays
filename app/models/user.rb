class User < ApplicationRecord
   # after_create :send_welcome_email
  # This should be in a photo model but for demonstration purposes, it is in the user model
   # Using VIRTUAL ATTRIBUTES to set our photo
  # 
  # This works because the temp photo is passed in 
  #   from our form under the `photo_data` key,
  #   which expects a `photo_data=` setter to
  #   be present in our model when we call `new` on it.
  # We have just made that setter do a bit more
  #   than usual since it needs to process the
  #   data with the `read` method *and* parse out
  #   some additional attributes as part of the save.

  # Uploading via database blob
  def photo_data=(photo_data)
    self.data      = photo_data.read
    self.filename  = photo_data.original_filename
    self.mime_type = photo_data.content_type
  end

  # Using paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  # , :default_url => ":style_missing.jpeg"
   # You'll want to make sure you've whitelisted only acceptable
  # content types to avoid attacks
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Individual validation method 1 (validates)
  validates :avatar, :attachment_presence => true

# Individual validation method 2 (validates_with)
  # validates_with AttachmentPresenceValidator, :attributes => :avatar
  # validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

# Multiple validations on one attribute:
  # validates_attachment :avatar, :presence => true,
    # :content_type => { :content_type => "image/jpeg" },
    # :size => { :in => 0..10.kilobytes }
  # private
  def self.send_welcome_email(id)
    # Note that the bang (!) method will blow
    # up (roll back) the save transaction on failure
    user = User.find(id)
    UserMailer.welcome(user).deliver!
  end
end
