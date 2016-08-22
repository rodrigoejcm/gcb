require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gcb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionMailer::Base.smtp_settings = {
    	:addresss			=> 'mx1.hostinger.com.br',
    	:domain 			=> 'mx1.hostinger.com.br',
    	:port 				=> 587,
    	:user_name  		=> 'teste@vemgerir.96.lt',
    	:password 			=> 'senhateste',
    	:authentication 	=> 'login',
    	:enable_starttls_auto => true

    }
  end
end
