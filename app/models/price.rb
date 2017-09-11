class Price < ApplicationRecord
  belongs_to :section
  validates :value, presence: true

  scope :order_by_section, -> () { order(section_id: :asc) }
end
