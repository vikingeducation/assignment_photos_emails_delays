class User < ActiveRecord::Base

  has_attached_file :profile, :styles => { :medium => "300x300", :thumb => "100x100" }

  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :profile, :less_than => 2.megabytes


  attr_accessor :delete_profile

  before_validation { profile.clear if delete_profile == '1' }
end
