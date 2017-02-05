class User < ApplicationRecord
  has_attached_file :profile_picture, 
                    :styles => { :medium => '300x300', 
                                 :thumb => '100x100'}
  validates_attachment_content_type :profile_picture, 
                                    :content_type => /\Aimage\/.*\Z/
end
