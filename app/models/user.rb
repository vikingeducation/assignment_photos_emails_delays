class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: '300x300', thumb: '100x100'}, default_url: "https://s3.amazonaws.com/morganstorage/images/missing.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
