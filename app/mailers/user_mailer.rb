class UserMailer < ApplicationMailer
  default from: "something@example.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this app.")
  end

end
