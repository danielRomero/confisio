class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  acts_as_taggable

  belongs_to :user
  belongs_to :category
  has_many :subcategories, through: :category

  accepts_nested_attributes_for :category, :subcategories

  scope :by_create_date, -> { order(created_at: :desc) }

  scope :from_category, ->(category_name) { includes(:category).where(categories: {name: category_name}) }
  
  before_validation(on: :create) do
    self.user = current_user
  end

  validates_presence_of :category_id

  before_save :check_primary_image

  validates :user_id, presence: true


  def related_posts
    self.find_related_tags.where.not(id: self.id).limit(8).by_create_date
    # related_tags_for
  end
  
  private

    # Si no tiene imagen portada se coge la primera que se encuentre en el body
    def check_primary_image
      require 'nokogiri'
      if self.primary_image.blank?
        doc = Nokogiri::HTML(self.body)
        if image = doc.css('img').first
          self.primary_image = image.attr('src')
        end
      end
    end
end
