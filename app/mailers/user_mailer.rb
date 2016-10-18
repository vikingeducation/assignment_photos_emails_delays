class UserMailer < ApplicationMailer
  default :from => 'wink@you.me'

  def welcome(user)
    puts 'Sending welcome email'
    @user = user
    mail(
      :to => @user.email,
      :subject => Time.now.to_i.even? ? 'Welcome to Your Doom!' : 'Rise from Your Grave!'
    )
  end
end
