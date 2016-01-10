namespace :db do
  desc 'Dumps the database to backups'
  task dump: :environment do
    dump_fmt = 'c' # or 'p', 't', 'd'
    dump_sfx = suffix_for_format dump_fmt
    backup_dir = backup_directory true
    cmd = nil
    with_config do |app, host, db, user|
      file_name = Time.now.strftime('%Y%m%d%H%M%S') + '_' + db + '.' + dump_sfx
      cmd = "pg_dump -F #{dump_fmt} -v -h #{host} -d #{db} -f #{backup_dir}/#{file_name}"
    end
    puts cmd
    exec cmd
  end

  desc 'Show the existing database backups'
  task list: :environment do
    backup_dir = backup_directory
    puts "#{backup_dir}"
    exec "/bin/ls -lt #{backup_dir}"
  end

  # USAGE => $ rake db_restore[name_backup_to_restore.dump]
  desc 'Restores the database from a backup using PATTERN'
  task :restore, [:pat] => :environment do |_task, args|
    if args.pat.present?
      cmd = nil
      with_config do |app, host, db, user|
        unless app.blank? || host.blank? || db.blank? || user.blank?
          backup_dir = backup_directory
          files = Dir.glob("#{backup_dir}/*#{args.pat}*")
          case files.size
          when 0
            puts "No backups found for the pattern '#{args.pat}'"
          when 1
            file = files.first
            fmt = format_for_file file
            if fmt.nil?
              puts "No recognized dump file suffix: #{file}"
            else
              cmd = "pg_restore -F #{fmt} -v -c -C -d #{user} #{file}"
            end
          else
            puts "Too many files match the pattern '#{args.pat}':"
            puts ' ' + files.join("\n ")
            puts 'Try a more specific pattern'
          end
        else
          puts 'something wrong'
          puts "app: #{app}\nhost: #{host}\ndb: #{db}\nuser: #{user}"
        end
      end
      unless cmd.nil?
        Rake::Task['db:drop'].invoke
        Rake::Task['db:create'].invoke
        puts 'Restoring...'
        puts cmd.to_s
        exec cmd
      end
    else
      puts 'Please pass a pattern to the task'
    end
  end

  desc 'Upload database backups to dropbox and remove files'
  task upload_all_database_backups: :environment do
    client = Dropbox::API::Client.new(:token  => ENV['DROPBOX_CLIENT_TOKEN'], :secret => ENV['DROPBOX_CLIENT_SECRET'])
    files = Dir.glob("#{backup_directory}/*")
    files.each do |file|
      client.chunked_upload file.split('/').last, File.open(file)
    end
    Rake::Task['db:remove_database_backups'].invoke
  end

  desc 'Remove database backups'
  task remove_database_backups: :environment do
    files = Dir.glob("#{backup_directory}/*")
    files.each do |file|
      File.delete(file)
    end
  end

  private

  def suffix_for_format(suffix)
    case suffix
    when 'c' then 'dump'
    when 'p' then 'sql'
    when 't' then 'tar'
    when 'd' then 'dir'
    end
  end

  def format_for_file(file)
    case file
    when /\.dump$/ then 'c'
    when /\.sql$/  then 'p'
    when /\.dir$/  then 'd'
    when /\.tar$/  then 't'
    end
  end

  def backup_directory(create = false)
    if Rails.env.production?
      backup_dir = '/var/www/confisio/shared/backups'
    else
      backup_dir = "#{Rails.root}/db/backups"
    end
    if create && !Dir.exist?(backup_dir)
      puts "Creating #{backup_dir} .."
      Dir.mkdir(backup_dir)
    end
    backup_dir
  end

  def with_config
    yield Rails.application.class.parent_name.underscore,
    ActiveRecord::Base.connection_config[:host] || 'localhost',
    ActiveRecord::Base.connection_config[:database],
    # database username or system logged user
    ActiveRecord::Base.connection_config[:username] || Etc.getpwuid(Process.uid).name
  end
end
