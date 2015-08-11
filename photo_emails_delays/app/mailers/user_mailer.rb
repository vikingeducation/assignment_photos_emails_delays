class UserMailer < ApplicationMailer

  default from: "server@example.com",
          to: "personal_email@email.com",
          subject: "Email from website"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PhotoApp!')
  end
end
