class UserMailer < ApplicationMailer
  default :from => "from@example.com"

  def welcome(id)
    @user = User.find(id)
    mail(to: @user.email, subject: "Welcome, friend!")
  end

end
