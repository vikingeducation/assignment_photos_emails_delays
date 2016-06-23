class User < ActiveRecord::Base

  has_attached_file :profile_photo, styles: {:thumb => "150x150"}

  validates_attachment :profile_photo, presence: true,
                                       content_type: { content_type: /\Aimage\/.*\Z/ },
                                       size: { less_than: 2.megabytes }

end
