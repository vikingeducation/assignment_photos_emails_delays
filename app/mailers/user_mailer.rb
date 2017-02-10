class UserMailer < ApplicationMailer
  default from: 'user@mailer.com'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
