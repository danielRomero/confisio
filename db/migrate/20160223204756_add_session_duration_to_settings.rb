class AddSessionDurationToSettings < ActiveRecord::Migration[4.2]
  def self.up
    add_column :settings, :session_duration, :time
    Setting.all.each do |setting|
      setting.update_attributes(session_duration: "1:00".to_datetime)
    end
  end
  def self.down
    remove_column :settings, :session_duration
  end
end
