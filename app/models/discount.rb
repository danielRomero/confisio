class Discount < ActiveRecord::Base
  belongs_to :section, touch: true
  validates :title, presence: true
  validates :value, presence: true

  before_create :generate_permalink

  private
    def generate_permalink
      self.permalink = self.title.parameterize
    end
end
