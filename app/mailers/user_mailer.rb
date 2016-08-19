class UserMailer < ApplicationMailer

	default from: "hannahsquier@gmail.com.com", subject: "Welcome!"

	def welcome(user)
		@user = user
		mail(to: @user.email)
	end
end
