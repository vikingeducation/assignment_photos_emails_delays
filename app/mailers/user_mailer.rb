class UserMailer < ApplicationMailer
  default from: "welcome@test.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "This is a test")
  end
end
