class ApplicationMailer < ActionMailer::Base
  default from: "welcome@photos.com"
  layout 'mailer'
end
