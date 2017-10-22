class UserMailer < ApplicationMailer

  default :from => "wszyscy@op.pl"

  def welcome(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to our photos_emails_delays services!!!")
  end
end
