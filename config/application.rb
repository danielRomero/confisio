require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

APP_NAME = 'confisio'

APP_LOGO = 'https://res-4.cloudinary.com/confisio/image/upload/t_media_lib_thumb/v1435183432/logo-marca/logo-nombre-mano/logo-confisio-def_200_64.png'

APP_META_KEYWORDS = %w[fisioterapia madrid cefalea tratamiento psicología osteopatía posturólogo posturología cognitivo-conductual ansiedad estrés ]

APP_META_DESCRIPTION = "Clínica de fisioterapia y psicología en Madrid. Para nosotros es importante resolver tus dudas, y que entiendas las causas del problema, para hacerte participe del tratamiento y evitar recaidas. Fisioterapeutas y psicólogos colegiados en constante formación."

module Confisio
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Madrid'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_mailer.perform_deliveries = true

    config.action_mailer.delivery_method = :smtp

    config.action_mailer.default_url_options = { host: ENV['HOST'] }
    config.action_mailer.default :charset => "utf-8"
    config.action_mailer.smtp_settings = {
      :address   => ENV['SMTP_ADDRESS'],
      :port      => ENV['SMTP_PORT'],
      :enable_starttls_auto => true,
      :user_name => ENV['SMTP_USERNAME'],
      :password  => ENV['SMTP_PASSWORD'],
      :authentication => 'login',
      :domain => ENV['HOST'],
    }

    config.middleware.use Rack::Deflater

    Dropbox::API::Config.app_key    = ENV['DROPBOX_KEY']
    Dropbox::API::Config.app_secret = ENV['DROPBOX_SECRET']
    Dropbox::API::Config.mode       = "sandbox"
  end
end
