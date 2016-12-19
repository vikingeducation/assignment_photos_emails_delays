ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '25',
  :domain => 'https://ancient-castle-22348.herokuapp.com',
  :authentication => :plain,
  :user_name => Rails.application.secrets.sendgrid_username,
  :password => Rails.application.secrets.sendgrid_password
}
