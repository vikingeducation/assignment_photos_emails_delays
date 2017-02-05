class User < ApplicationRecord
  has_attached_file :profile_picture, 
                    :styles => { :medium => '300x300', 
                                 :thumb => '100x100'},
                    default_url: 'missing.jpg'
  validates_attachment_content_type :profile_picture, 
                                    :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_profile_picture
  before_validation { profile_picture.clear if 
                                    delete_profile_picture == '1' }
end
