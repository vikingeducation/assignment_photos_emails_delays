class UserMailer < ApplicationMailer
  default from: "heroku_user@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome @user.username!")
  end

end
