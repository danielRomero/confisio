# Load the Rails application.
require File.expand_path('../application', __FILE__)

Dotenv::Railtie.load
ENV['RAILS_ENV'] = ENV['ENVIRONMENT']
Rails.env = ENV['RAILS_ENV']

# Initialize the Rails application.
Rails.application.initialize!
