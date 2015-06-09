class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  acts_as_taggable

  belongs_to :user
  belongs_to :category, touch: true

  has_many :posts_subcategories
  has_many :subcategories, :through => :posts_subcategories

  scope :by_create_date, -> { order(created_at: :desc) }

  scope :from_category, ->(category_name) { includes(:category).where(categories: {name: category_name}) }
  
  before_validation(on: :create) do
    self.user = current_user
  end

  validates_presence_of :category_id

  before_save :check_primary_image
  before_create :generate_permalink

  validates :user_id, presence: true
  validates :title, presence: true


  def related_posts
    self.find_related_tags.where.not(id: self.id).limit(8).by_create_date
    # related_tags_for
  end
  
  private

    # Si no tiene imagen portada se coge la primera que se encuentre en el body
    def check_primary_image
      require 'nokogiri'
      require 'nokogiri-styles'
      
      doc = Nokogiri::HTML(self.body)
      
      if self.primary_image.blank?
        if image = doc.css('img').first
          self.primary_image = image.attr('src')
        end
      end
      
      # style images
      for image in doc.css('img')
        style = image.styles
        style['height'] = 'auto'
        style['max-width'] = '100%'
        image.styles = style
      end

      self.body = doc
    end

    def generate_permalink
      loop do
        times = nil
        self.permalink = "#{self.title.parameterize}#{times}"
        times += 1
        break unless Post.find_by(permalink: self.permalink)
      end
    end
end
