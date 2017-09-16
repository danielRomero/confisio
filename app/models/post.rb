class Post < ApplicationRecord
  mount_uploader :banner, BannerUploader
  acts_as_taggable
  belongs_to :section

  scope :ordered, -> () { order(created_at: :desc) }
  scope :latest,  -> () { limit(4).ordered }
  scope :latest_by,  -> (count) { limit(count).ordered }
  scope :others,  -> (post_id) { latest.where.not(id: post_id) }
  
  before_create :set_permalink

  validates :title, :body, presence: true
  validates :permalink, uniqueness: true

  def body_preview
    doc = Nokogiri::HTML(self.body)
    result = ''
    doc.css('p').each do |elem|
      result = result + elem.text
      break if result.length >= 250
    end
  end

  private

  def set_permalink
    times = 0
    loop do
      self.permalink = "#{title.parameterize}#{times == 0 ? nil : '-' + times.to_s}"
      times += 1
      break unless Post.find_by(permalink: self.permalink)
    end
  end
end
