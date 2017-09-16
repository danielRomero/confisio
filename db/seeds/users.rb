unless Rails.env.production?
  User.find_or_initialize_by(email: 'test@test.com').update_attributes(password: 123123, password_confirmation: 123123)
end
puts "#{User.count} users\n\n"
