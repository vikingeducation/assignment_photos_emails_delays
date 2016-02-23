class UserMailer < ApplicationMailer
  default from: "abc@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome!")
  end

end
