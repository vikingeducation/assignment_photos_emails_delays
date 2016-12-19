class UserMailer < ApplicationMailer
  default from: "foo@bar.com", subject: "Welcome"

  # create/build user email
  # def welcome(user)
  #   @user = user
  #   mail(to: @user.email)
  # end

  # create/build user email, used for delayed/queued job
  # takes an id and finds the current state of that user
  def welcome(id)
    @user = User.find_by_id(id)
    mail(to: @user.email)
  end
end
