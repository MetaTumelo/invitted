class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@invitted.com'
  layout 'mailer'
end
