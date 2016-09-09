class FunMailer < ApplicationMailer
  default :from => "davidjeremywatts@gmail.com"
  default :to => "davidjeremywatts@gmail.com"
  default :subject => "what's up!?"

  

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CrudCrud!')
  end
end
