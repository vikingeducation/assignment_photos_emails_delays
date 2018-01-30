class UserMailer < ApplicationMailer
  default from: "richardson.ae@gmail.com"
  layout 'mailer'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Photos/Emails App!')
  end
end
