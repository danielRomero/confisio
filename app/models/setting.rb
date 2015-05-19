class Setting < ActiveRecord::Base
  before_create :only_one
  before_save :remove_blank_from_arrays
  before_destroy :no_destroy


  private
    def only_one
      if Setting.count >= 1
        self.errors.add(:only_one, "No puedes crear más archivos de configuración")
        return false
      end
    end

    def remove_blank_from_arrays
      self.landing_quotes = self.landing_quotes - ["", nil]
      self.landing_images = self.landing_images - ["", nil]
    end

    def no_destroy
      return false
    end
end
