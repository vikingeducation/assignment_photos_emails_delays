class UserMailer < ApplicationMailer
  # after_action :prevent_delivery_to_guests
  default :from => "from@example.com"

   def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Test Assignment!')
  end
end
