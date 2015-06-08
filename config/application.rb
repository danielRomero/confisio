require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

RAILS_ENV = ENV["RAILS_ENV"]

APP_NAME = "Confisio"

APP_META_KEYWORDS = %w[fisioterapia madrid cefaleas tratamiento]
APP_META_DESCRIPTION = "Clínica de fisioterapia y psicología. Para nosotros es importante resolver tus dudas, y que entiendas las causas del problema, para hacerte participe del tratamiento y evitar recaidas. Fisioterapeutas y psicólogos colegiados en constante formación."

module Confisio
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    
    config.time_zone = 'Madrid'
  end
end
