class UserMailer < ApplicationMailer
default :from => "grahamanddavid@aol.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PHOTOS!')
  end

end
