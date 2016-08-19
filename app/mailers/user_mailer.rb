class UserMailer < ActionMailer::Base
  default from: "philandmatt@viking.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the Ultimate Website. Finally, all your dreams will come true.')
  end
end
