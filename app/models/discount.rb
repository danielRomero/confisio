class Discount < ActiveRecord::Base
  belongs_to :section, touch: true
  validates :title, presence: true
  validates :value, presence: true

  before_create :generate_permalink

  private
    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.title.parameterize}#{times == 0 ? nil : times}"
        times += 1
        break unless !(Rails.application.routes.recognize_path(self.permalink) rescue nil)
      end
    end
end
