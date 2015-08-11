class Post < ActiveRecord::Base

  belongs_to :category, touch: true
  belongs_to :section, touch: true

  has_and_belongs_to_many :categories

  scope :by_create_date, -> { order(created_at: :desc) }

  validates_presence_of :section_id, :body, :title

  before_save :check_primary_image
  before_save :check_body_preview
  before_create :generate_permalink

  # def related_posts
  #   self.find_related_tags.where.not(id: self.id).limit(8).by_create_date
  #   # related_tags_for
  # end

  # First 200 characteres of post's body without HTML elements for description meta tag
  def meta_description
    require 'nokogiri'
    require 'nokogiri-styles'  
    doc = Nokogiri::HTML(self.body)
    return doc.css('p').first.children.text[0..200]
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

    def check_body_preview
      doc = Nokogiri::HTML(self.body)
      self.body_preview = doc.css('p').first.text
    end

    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.title.parameterize}#{times == 0 ? nil : times}"
        times += 1
        break unless Post.find_by(permalink: self.permalink) or !(Rails.application.routes.recognize_path(self.permalink) rescue nil)
      end
    end
end
