require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Confisio
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Madrid'
    config.i18n.default_locale = :es

    config.action_mailer.perform_deliveries  = true
    config.action_mailer.delivery_method     = :smtp
    config.action_mailer.default_url_options = { host: ENV['HOST'] }

    config.action_mailer.default charset: 'utf-8'

    config.action_mailer.smtp_settings = {
      authentication: :plain,
      address:        ENV['SMTP_ADDRESS'],
      port:           587,
      domain:         ENV['SMTP_DOMAIN'],
      user_name:      ENV['SMTP_USERNAME'],
      password:       ENV['SMTP_PASSWORD']
    }
  end
end
