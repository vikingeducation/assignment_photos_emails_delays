class WelcomeMailer < ApplicationMailer
  default from: "welcome@example.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Photo App!')
  end
end
