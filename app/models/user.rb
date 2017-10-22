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

  after_create :send_welcome_email_now
  # after_create :queue_welcome_email


  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver_later(wait: 10.minutes)
  end

  private
  def send_welcome_email_now
    UserMailer.welcome(self).deliver!
  end

  def queue_welcome_email
    UserMailer.welcome(self).deliver_later
  end


end
