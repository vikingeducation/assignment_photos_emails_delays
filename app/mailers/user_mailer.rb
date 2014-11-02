class UserMailer < ActionMailer::Base
  default from: "welcome@sprint.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome!")
  end
end
