require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

APP_NAME = 'confisio'

APP_META_KEYWORDS = %w[fisioterapia madrid cefalea tratamiento psicología osteopatía posturólogo posturología cognitivo-conductual ansiedad estrés ]

APP_META_DESCRIPTION = "Clínica de fisioterapia y psicología. Para nosotros es importante resolver tus dudas, y que entiendas las causas del problema, para hacerte participe del tratamiento y evitar recaidas. Fisioterapeutas y psicólogos colegiados en constante formación."

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

    config.middleware.use Rack::Cache,
      :verbose => true,
      :metastore   => 'file:/var/cache/rack/meta',
      :entitystore => 'file:/var/cache/rack/body'
  end
end
