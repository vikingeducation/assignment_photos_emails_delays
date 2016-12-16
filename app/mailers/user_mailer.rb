class UserMailer < ApplicationMailer
  default from: "foo@bar.com", subject: "Welcome"
  def welcome(user)
    @user = user
    mail(to: @user.email)
  end
end
