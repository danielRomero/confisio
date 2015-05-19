json.array!(@settings) do |setting|
  json.extract! setting, :id, :landing_quotes, :landing_images, :phone, :mobile_phone, :address_street, :address_cp, :primary_email
  json.url setting_url(setting, format: :json)
end
