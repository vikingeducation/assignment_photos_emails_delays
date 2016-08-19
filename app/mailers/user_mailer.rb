class UserMailer < ApplicationMailer
  default :from => "mike@alex.leo"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this website.")
  end
end
