class User < ApplicationRecord
  has_attached_file :avatar, :styles => { medium: "500x500", thumb: "150x150"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
