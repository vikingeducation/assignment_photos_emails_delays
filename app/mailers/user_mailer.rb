class UserMailer < ApplicationMailer
  default :from => "danebook@liangboyuan.pub"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Danebook!")
  end
end
