class Section < ActiveRecord::Base
  has_one :setting, dependent: :destroy
  has_many :users
  has_many :posts
  has_many :discounts
  has_many :categories

  validates :name, presence: true

  scope :ordered, -> () { order(created_at: :asc) }

  before_create :generate_permalink
  before_create :create_setting

  SECTIONS_PERMALINK_AVAILABLES = %w(fisioterapia psicologia)

  Section::SECTIONS_PERMALINK_AVAILABLES.each do |permalink|
    define_method("is_#{permalink}?") do
      self.permalink == permalink
    end
  end

  private

  def generate_permalink
    self.permalink = name.parameterize
  end

  def create_setting
    self.setting = Setting.new
  end

end
