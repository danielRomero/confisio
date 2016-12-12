require 'dotenv'
Dotenv.load
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, '/var/www/confisio/shared/log/cron_log.log'
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# every '0 3 * * 6', roles: [:app] do
#   rake "PGPASSWORD='#{ENV['DATABASE_PASSWORD']}' db:dump"
# end

# every '15 3 * * 6', roles: [:app] do
#   rake 'db:upload_all_database_backups'
# end
