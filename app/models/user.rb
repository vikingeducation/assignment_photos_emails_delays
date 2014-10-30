class User < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumb => "100x100" }

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
