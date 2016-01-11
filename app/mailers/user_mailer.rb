class UserMailer < ApplicationMailer
  default from: "noreply@test.nightiron.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Planet Earth!")
  end
end
