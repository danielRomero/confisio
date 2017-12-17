namespace :maintenance do
  desc "Recreate image versions for carrierwave"
  task recreate_images: :environment do
    CarouselImage.find_each do |ci|
      ci.image.recreate_versions! if ci.image?
    end

    Post.find_each do |post|
      post.banner.recreate_versions! if post.banner?
    end

    Section.find_each do |section|
      section.banner.recreate_versions! if section.banner?
    end
  end

end
