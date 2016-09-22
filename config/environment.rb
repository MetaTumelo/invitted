# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
   address:              'smtp.zoho.com',
   port:                 465,
   domain:               'invitted.com',
   user_name:            'tumi@invitted.com',
   password:             'xxP@ssword12',
   authentication:       'plain',
   enable_starttls_auto: true 
}
