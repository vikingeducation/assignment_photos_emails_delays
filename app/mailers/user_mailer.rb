class UserMailer < ApplicationMailer
  default from: "dev@testapp.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to TestApp!")
  end
end
