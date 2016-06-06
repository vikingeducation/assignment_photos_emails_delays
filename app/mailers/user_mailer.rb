class UserMailer < ApplicationMailer
  default :from => "prime_pork3@hotmail.com"

  # This just builds the email, it doesn't send it.
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CrudCrud!')
  end
end
