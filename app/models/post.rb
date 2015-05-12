class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  acts_as_taggable

  belongs_to :user

  scope :by_create_date, -> { order(created_at: :desc) }
  
  before_validation(on: :create) do
    # self.user = current_user
    self.user_id = 1
  end

  before_save :check_primary_image

  validates :user_id, presence: true


  def related_posts
    Post.tagged_with(self.tags, on: :tags).where.not(id: self.id).limit(8).by_create_date
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
