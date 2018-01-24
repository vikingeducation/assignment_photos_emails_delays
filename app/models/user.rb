class User < ApplicationRecord

  attr_accessor :delete_profile_pic

  has_attached_file :profile_pic, :styles => { :large => "600x600",:medium => "300x300", :thumb => "100x100" },
      default_url: ":style_profile_pic_missing.jpg"

  # runs a callback to delete all styles of the file if the form checkbox is true
  before_validation { profile_pic.clear if delete_profile_pic == '1' }

  # You'll want to make sure you've whitelisted only acceptable content types to avoid attacks
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
  # or
  # validates_attachment :profile_pic, :presence => true,
  #   :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  #   :size => { :in => 0..1000.kilobytes }

end
