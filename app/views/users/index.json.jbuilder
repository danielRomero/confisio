json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :email, :phone, :gender, :remember_token
  json.url user_url(user, format: :json)
end
