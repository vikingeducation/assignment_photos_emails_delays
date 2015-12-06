class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => {:medium => "300x300", :thumb => "100x100"}

  validates :username,
            :presence => true,
            :uniqueness => true

  validates :email,
            :presence => true,
            :uniqueness => true

  validates_attachment  :avatar,
                        :presence => true,
                        :content_type => {:content_type => /\Aimage\/.*\Z/},
                        :size => {:in => 0..1.megabytes}

  after_create :queue_welcome_email

  def queue_welcome_email
    User.delay.send_welcome_email(id)
  end

  def self.send_welcome_email(user_id)
    user = User.find(user_id)
    UserMailer.welcome(user).deliver!
  end
end

