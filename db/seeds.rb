require_relative 'seeds/users'
require_relative 'seeds/sections'
require_relative 'seeds/prices'
require_relative 'seeds/discounts'
puts 'seeds posts'
Dir['db/seeds/posts/*'].each { |post| require_relative post.gsub('db/', '') }
puts "#{Post.count} posts\n\n"
# require_relative 'seeds/sections'
# require_relative 'seeds/sections'
# require_relative 'seeds/sections'
