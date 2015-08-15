module DiscountsHelper
  def cache_key_for_discounts
    count          = Discount.count
    max_updated_at = Discount.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "discounts/all-#{count}-#{max_updated_at}"
  end
end