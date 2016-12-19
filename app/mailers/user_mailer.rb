class UserMailer < ApplicationMailer
  default from: "john.popenuck@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this app.")
  end

end
