class User < ApplicationRecord
  after_create :send_delayed_welcome_email

  def send_delayed_welcome_email
    User.delay.send_welcome_email(self)
  end

  def self.send_welcome_email(id)
    user = User.find(id)
    UserMailer.welcome(user).deliver
  end
  
end
