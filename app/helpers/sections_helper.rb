module SectionsHelper
  def cache_key_for_sections
    count          = Section.count
    max_updated_at = Section.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "sections/all-#{count}-#{max_updated_at}"
  end
end