class Category < ActiveRecord::Base
  belongs_to :section, touch: true
  has_and_belongs_to_many :posts
  validates :name, presence: true

  before_create :generate_permalink
  private
    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.name.parameterize}#{times == 0 ? nil : times}"
        times += 1
        break unless (Rails.application.routes.recognize_path(self.permalink) rescue nil)
      end
    end
end
