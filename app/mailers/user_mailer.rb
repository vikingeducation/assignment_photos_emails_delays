class UserMailer < ActionMailer::Base
  default from: "miking_the_viking@vikingcodeschool.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to this terrible test app!")
  end
end
