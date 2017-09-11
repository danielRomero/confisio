class Section < ApplicationRecord
  mount_uploader :banner, BannerUploader
  has_many :prices
  has_many :discounts
  has_many :posts

  validates :body, :title, presence: true
  validates_uniqueness_of :permalink

  scope :ordered, -> () { order(created_at: :asc) }

  before_create :set_permalink

  private

  def set_permalink
    self.permalink = self.title.parameterize
  end
end
