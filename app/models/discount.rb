class Discount < ApplicationRecord
  belongs_to :section

  before_create :set_permalink

  validates :valid_to, :title, presence: true
  validates_uniqueness_of :permalink

  scope :order_by_section, -> () { order(section_id: :asc) }

  private

  def set_permalink
    times = 0
    loop do
      self.permalink = "#{title.parameterize}#{times == 0 ? nil : '-' + times.to_s}"
      times += 1
      break unless Discount.find_by(permalink: permalink)
    end
  end
end
