class User < ActiveRecord::Base

  has_secure_password

  has_many :posts
  has_many :discounts
  belongs_to :section
  
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }, :if => lambda{ new_record? || !password.nil? }
  
  before_create :create_remember_token
  before_create :generate_permalink

  scope :employers, -> {where.not(degree: nil)}

  def is_employee?
    !self.degree.nil?
  end

  def full_name
    "#{self.name} #{self.surname}"
  end

  private
    def create_remember_token
      self.remember_token = Digest::SHA2.hexdigest(SecureRandom.urlsafe_base64.to_s)
    end

    def generate_permalink
      times = 0
      loop do
        self.permalink = "#{self.full_name.parameterize}#{times == 0 ? nil : times}"
        times += 1
        break unless User.find_by(permalink: self.permalink) or !(Rails.application.routes.recognize_path(self.permalink) rescue nil)
      end
    end
end