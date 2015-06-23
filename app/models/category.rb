class Category < ActiveRecord::Base
  has_many :posts
  has_many :subcategories
  validates :name, presence: true
  PSICOLOGIA = "Psicología"
  FISIOTERAPIA = "Fisioterapia"
  AVAILABLES = [FISIOTERAPIA, PSICOLOGIA]

  def name_safe
    return case self.name
      when Category::PSICOLOGIA
        'psicologia' # Al loro con el acento
      else
        'fisioterapia'
    end
  end

  def self.name_from_name_safe name
    return case self.name
      when 'psicologia'
        Category::PSICOLOGIA
      else
        Category::FISIOTERAPIA
    end
  end

  def self.valid_name?(name)
    return Category::AVAILABLES.include?(name)
  end
end