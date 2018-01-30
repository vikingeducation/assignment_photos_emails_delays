class UserMailer < ApplicationMailer
  default from: "richardson.ae@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Photos/Emails App!')
  end
end
