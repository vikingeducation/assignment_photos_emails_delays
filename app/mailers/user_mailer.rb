class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to assignment photos and emails delays !")
  end
end
