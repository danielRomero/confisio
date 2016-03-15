class Discount < ActiveRecord::Base
  belongs_to :section, touch: true
  validates :title, presence: true
  validates :value, presence: true

  scope :by_create_date, -> () { order(created_at: :asc) }

  before_create :generate_permalink

  private
    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.title.parameterize}#{times == 0 ? nil : '-' + times.to_s}"
        times += 1
        break unless Discount.find_by(permalink: self.permalink, section_id: self.section_id)
      end
    end
end
