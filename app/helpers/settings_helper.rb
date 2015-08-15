module SettingsHelper
  def cache_key_for_settings
    count          = Setting.count
    max_updated_at = Setting.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "settings/all-#{count}-#{max_updated_at}"
  end
end