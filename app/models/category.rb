class Category < ActiveRecord::Base
  belongs_to :section, touch: true
  has_and_belongs_to_many :posts
  validates :name, presence: true

  before_create :generate_permalink
  private
    def generate_permalink
      self.permalink = self.name.parameterize
    end
end
