module UsersHelper
  def cache_key_for_employers
    count          = User.employers.count
    max_updated_at = User.employers.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "employers/all-#{count}-#{max_updated_at}"
  end
end