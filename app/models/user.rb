class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment :avatar, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ }
end
