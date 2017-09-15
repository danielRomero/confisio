class Discount < ApplicationRecord
  belongs_to :section

  validates :valid_to, :title, presence: true
  validates :permalink, uniqueness: true

  scope :order_by_section, -> () { order(section_id: :asc) }

  before_create :set_permalink

  private

  def set_permalink
    self.permalink = "#{self.title} #{self.section.permalink}".parameterize
  end
end
