module Admin
  class CarouselImagesController < AdminController
    before_action :set_carousel_image, only: [:show, :edit, :update, :destroy]

    def index
      @carousel_images = CarouselImage.all
    end

    def show
    end

    def new
      @carousel_image = CarouselImage.new
    end

    def edit
    end

    def create
      @carousel_image = CarouselImage.new(carousel_image_params)

      if @carousel_image.save
        redirect_to admin_carousel_images_path, notice: 'Carousel image was successfully created.'
      else
        render :new
      end
    end

    def update
      if @carousel_image.update(carousel_image_params)
        redirect_to admin_carousel_images_path, notice: 'Carousel image was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @carousel_image.destroy
      redirect_to admin_carousel_images_url, notice: 'Carousel image was successfully destroyed.'
    end

    private

      def set_carousel_image
        @carousel_image = CarouselImage.find(params[:id])
      end

      def carousel_image_params
        params.require(:carousel_image).permit(:image, :hidden, :image_cache, :remove_image)
      end
  end
end
