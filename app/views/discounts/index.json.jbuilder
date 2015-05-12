json.array!(@discounts) do |discount|
  json.extract! discount, :id, :user_id, :code, :discount_type, :title, :description, :quantity
  json.url discount_url(discount, format: :json)
end
