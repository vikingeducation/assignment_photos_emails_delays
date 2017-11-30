class UserMailer < ApplicationMailer
  default from: "dev@still-cove-64200.herokuapp.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to still-cove-64200.herokuapp.com!")
  end
end
