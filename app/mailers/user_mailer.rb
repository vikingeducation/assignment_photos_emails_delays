class UserMailer < ApplicationMailer
  default :from => "email@email.com", :subject => "Welcome"
  

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the app")
  end

end
