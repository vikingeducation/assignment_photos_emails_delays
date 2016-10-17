class UserSendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args.first
    user = User.find(user_id)
    UserMailer.welcome(user).deliver_now
  end
end
