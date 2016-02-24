class Category < ActiveRecord::Base
  belongs_to :section, touch: true
  has_and_belongs_to_many :posts
  validates :name, presence: true

  before_create :generate_permalink

  scope :with_posts, -> { joins(:posts).uniq }
  
  private
    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.name.parameterize}#{times == 0 ? nil : '-' + times.to_s}"
        times += 1
        break unless Category.find_by(permalink: self.permalink, section_id: self.section_id)
      end
    end
end
