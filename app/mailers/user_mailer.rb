class UserMailer < ApplicationMailer
  default from: "welcomecommittee@crudcrud.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CrudCrud!')
  end
end
