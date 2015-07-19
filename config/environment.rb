# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

  ActionMailer::Base.smtp_settings = {
    user_name: 'app38880671@heroku.com',
    password: 'rekohaln0204',
    domain: "https://quiet-spire-6855.herokuapp.com/",
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }

  config.action_mailer.default_url_options = { host: 'localhost' }
