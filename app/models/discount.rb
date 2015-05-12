class Discount < ActiveRecord::Base
  belongs_to :user
  validates :code, uniqueness: true
  validates :title, presence: true

  validate :check_empty_code

  scope :without_user,   -> { where(user_id: nil) }
  scope :by_create_date, -> { order(created_at: :desc) }

  TYPES = %w[€ % unidades]

  def self.generate_promotional_code
    SecureRandom.urlsafe_base64(nil, false)
  end


  private
    def check_empty_code
      self.code = Discount.generate_promotional_code if !self.code
    end

end
