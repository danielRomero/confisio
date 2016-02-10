class ApplicationMailer < ActionMailer::Base
  default from: AppConfiguration.first.email
  layout 'mailer'
end
