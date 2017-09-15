class Section < ApplicationRecord
  mount_uploader :banner, BannerUploader
  has_many :prices, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :body, :title, presence: true
  validates :permalink, uniqueness: true

  scope :ordered, -> () { order(created_at: :asc) }

  before_create :set_permalink

  private

  def set_permalink
    self.permalink = self.title.parameterize
  end
end
