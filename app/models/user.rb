class User < ApplicationRecord

  has_attached_file :avatar,
                    :styles => { :medium => "300x300", :thumb => "100x100" },
                    :convert_options => {
                      :thumb => '-set -channel RGBA  -blur 0x8'
                    }
  validates_attachment_content_type :avatar,
                                  :presence => true,
                                  :size => { :in => 0..10.megabytes },
                                  :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/
                                                    }
end
