class Subcategory < ActiveRecord::Base
  belongs_to :category

  has_many :posts_subcategories
  has_many :posts, :through => :posts_subcategories

  validates :name, :category_id, presence: true
end
