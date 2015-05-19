class Discount < ActiveRecord::Base
  belongs_to :user
  validates :code, uniqueness: true
  validates :title, presence: true

  validate :check_empty_code

  scope :without_user,   -> { where(user_id: nil) }
  scope :by_create_date, -> { order(created_at: :desc) }

  TYPES = %w[€ % unidades]

  def self.generate_promotional_code
    new_code = SecureRandom.urlsafe_base64(nil, false)
    Discount.generate_promotional_code if Discount.find_by(code: new_code)
    return new_code
  end


  private
    def check_empty_code
      self.code = Discount.generate_promotional_code if !self.code
    end

end
