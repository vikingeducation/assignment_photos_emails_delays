class User < ActiveRecord::Base

  has_attached_file :profile, :styles => { :medium => "300x300", :thumb => "100x100" }

  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/

end
