require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Invitted
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
         config.exception_handler = {
            dev: false,
            db:     false, #-> defaults to :errors if true, else use :table_name
            email:  false, #-> need to integrate
            layouts: {
                '404' => 'application',
                '400' => 'application',
                '500' => 'application'
            },
    }
    
  end
end
