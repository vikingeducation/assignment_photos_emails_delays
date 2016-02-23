class UserMailer < ApplicationMailer
  default from: 'foo@bar.com'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome!')
  end
end
