module CategoriesHelper
  def cache_key_for_categories
    count          = Category.count
    max_updated_at = Category.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "categories/all-#{count}-#{max_updated_at}"
  end
end