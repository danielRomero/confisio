class CarouselImage < ApplicationRecord
  mount_uploader :image, CarouselUploader
  scope :availables, -> () { where(hidden: false) }
end
