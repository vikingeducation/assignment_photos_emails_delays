class User < ApplicationRecord
  after_create :send_welcome_email

  def index
  end

  def create
    @user = User.new(safe_user_params)

    @user.save
    redirect_to @user
  end


   private

    def safe_user_params
      params.require(:user).permit(:username, :email)
    end

    def send_welcome_email
      UserMailer.welcome(self).deliver!
    end
end
