class UserMailer < ApplicationMailer
  default from: "anything@anything.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this app.")
  end

end
