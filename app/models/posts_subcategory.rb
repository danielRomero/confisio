class PostsSubcategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :subcategory
end
