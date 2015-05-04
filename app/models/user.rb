class User < ActiveRecord::Base
  has_secure_password
  validates :password, :presence => true, :confirmation => true, :length => { :minimum => 5 }, :if => lambda{ new_record? || !password.nil? }
  before_create :create_remember_token
  private
    def create_remember_token
      self.remember_token = Digest::SHA2.hexdigest(SecureRandom.urlsafe_base64.to_s)
    end
end
