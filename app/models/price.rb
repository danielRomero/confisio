class Price < ActiveRecord::Base
  belongs_to :section, touch: true
  validates_presence_of :section_id
  scope :by_create_date, -> () { order(created_at: :asc) }
end
