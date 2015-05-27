class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :posts, through: :category

  validates :name, :category_id, presence: true
end
