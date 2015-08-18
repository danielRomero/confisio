# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'confisio'
set :repo_url, 'git@github.com:danielRomero/confisio.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :rails_env, 'production'               # If the environment differs from the stage name
set :migration_role, 'db'                  # Defaults to 'db'
set :conditionally_migrate, true           # Defaults to false. If true, it's skip migration if files in db/migrate not modified
set :assets_roles, [:web, :app]            # Defaults to [:web]
set :assets_prefix, 'assets'   # Defaults to 'assets' this should match config.assets.prefix in your rails config/application.rb
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}

# Default value for :linked_files is []
#set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')
set :linked_files, %w{config/database.yml config/secrets.yml .env}

set(:config_files, %w(config/database.yml config/secrets.yml .env))

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :passenger_restart_with_touch, true

# namespace :deploy do
#   task :default do
#     update
#     assets.precompile
#     restart
#     cleanup
#     # etc
#   end
# end

namespace :assets do
  desc "Precompile assets locally and then rsync to app servers"
  task :precompile do
    run_locally "bundle exec rake assets:precompile;"
    servers = find_servers :roles => [:app], :except => { :no_release => true }
    servers.each do |server|
      run_locally "rsync -av ./public/assets/ #{user}@#{server}:#{current_path}/public/assets/;"
    end
    run_locally "rm -rf public/assets"
  end
end

namespace :deploy do
  after :updated, "assets:precompile"
end


# namespace :deploy do
#   namespace :assets do
#     desc "Precompile assets locally and then rsync to web servers"
#     task :precompile do
#       on roles(:web) do
#         rsync_host = host.to_s # this needs to be done outside run_locally in order for host to exist
#         run_locally do
#           with rails_env: fetch(:stage) do
#             execute :bundle, "exec rake assets:precompile"
#           end
#           execute "rsync -av --delete ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/"
#           execute "rm -rf public/assets"
#           # execute "rm -rf tmp/cache/assets" # in case you are not seeing changes
#         end
#       end
#     end
#   end
# end

# namespace :deploy do
#   after :updated, "assets:precompile"
# end

# namespace :deploy do

#   # after :restart, :clear_cache do
#   #   on roles(:web), in: :groups, limit: 3, wait: 10 do
#   #     # Here we can do anything such as:
#   #     # within release_path do
#   #     #   execute :rake, 'cache:clear'
#   #     # end
#   #   end
#   # end

# end
