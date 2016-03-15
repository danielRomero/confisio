class Price < ActiveRecord::Base
  belongs_to :section, touch: true
  validates_presence_of :section_id, :value, :unit_name
  scope :by_create_date, -> () { order(created_at: :asc) }
end
