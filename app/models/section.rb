class Section < ActiveRecord::Base
  has_one :setting, dependent: :destroy
  has_many :posts
  has_many :discounts
  has_many :categories
  
  validates :name, presence: true

  before_create :generate_permalink
  before_create :create_setting
  private
    def generate_permalink
      self.permalink = self.name.parameterize
    end

    def create_setting
      self.setting = Setting.new
    end
end
