class UserMailer < ApplicationMailer
  default from: "welcomecommittee@ped.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PED!')
  end
end
