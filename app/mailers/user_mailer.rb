class UserMailer < ApplicationMailer
  default from: "admin@morganmart.in"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Howdy! Welcome to the App!')
  end
end
