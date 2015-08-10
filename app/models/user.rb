class User < ActiveRecord::Base
  has_attached_file :profile_pic, styles: {medium: '300x300', thumb: '100x100'}

  validates_attachment_content_type :profile_pic, content_type:/\Aimage\/.*\Z/

  before_validation { profile_pic.clear if delete_pic == '1' }

  attr_accessor :delete_pic


  
end
