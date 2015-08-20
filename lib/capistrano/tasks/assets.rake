# lib/capistrano/tasks/assets.rake

namespace :deploy do
  namespace :assets do

    Rake::Task['deploy:assets:precompile'].clear_actions

    desc 'Precompile assets locally and upload to servers'
    task :precompile do
      on roles(:web, :app) do
        # begin

        #   # find the most recent release
        #   latest_release = capture(:ls, '-xr', releases_path).split[1]

        #   # precompile if this is the first deploy
        #   raise PrecompileRequired unless latest_release

        #   #
        #   latest_release_path = releases_path.join(latest_release)

        #   # precompile if the previous deploy failed to finish precompiling
        #   execute(:ls, latest_release_path.join('assets_manifest_backup')) rescue raise(PrecompileRequired)

        #   fetch(:assets_dependencies).each do |dep|
        #     #execute(:du, '-b', release_path.join(dep)) rescue raise(PrecompileRequired)
        #     #execute(:du, '-b', latest_release_path.join(dep)) rescue raise(PrecompileRequired)

        #     # execute raises if there is a diff
        #     execute(:diff, '-Naur', release_path.join(dep), latest_release_path.join(dep)) rescue raise(PrecompileRequired)
        #   end

        #   warn("-----Skipping asset precompile, no asset diff found")

        #   # copy over all of the assets from the last release
        #   execute(:cp, '-rf', latest_release_path.join('public', fetch(:assets_prefix)), release_path.join('public', fetch(:assets_prefix)))

        # rescue PrecompileRequired
          warn("----Running assets precompile")

          run_locally do
            with rails_env: fetch(:rails_env) do
              execute 'bin/rake assets:precompile'
            end
          end

          within release_path do
            with rails_env: fetch(:rails_env) do
              old_manifest_path = "#{shared_path}/public/assets/manifest*"
              execute :rm, old_manifest_path if test "[ -f #{old_manifest_path} ]"
              upload!('./public/assets/', "#{shared_path}/public/", recursive: true)
            end
          end

          run_locally { execute 'rm -rf public/assets' }
        #end
      end
    end

  end
end