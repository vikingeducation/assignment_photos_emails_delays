class User < ApplicationRecord
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




  private
  def queue_welcome_email
    # # 1. Use the delayed job gem directly
    # User.delay.send_welcome_email(id)


    # # 2. Use ActiveJob to send the email
    # # in an ActiveJob class
    # UserSendWelcomeEmailJob.perform_later(id)


    # # 3. Emails can be delayed with one line
    # # because ActionMailer is integrated with
    # # ActiveJob in Rails 5
    UserMailer.welcome(self).deliver_later
  end


  def self.send_welcome_email(user_id)
    # 1. This method gets called when
    # using the delayed job gem
    # directly above
    user = User.find(user_id)
    UserMailer.welcome(user).deliver_now
  end
end

