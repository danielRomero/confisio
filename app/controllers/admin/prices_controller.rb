module Admin
  class PricesController < AdminController
    before_action :set_price, only: [:show, :edit, :update, :destroy]

    def index
      @prices = Price.includes(:section).order_by_section
    end

    def new
      @price = Price.new
    end

    def edit
    end

    def create
      @price = Price.new(price_params)

      if @price.save
        redirect_to admin_prices_path, notice: 'Price was successfully created.'
      else
        render :new
      end
    end

    def update
      if @price.update(price_params)
        redirect_to admin_prices_path, notice: 'Price was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @price.destroy
      redirect_to admin_prices_path, notice: 'Price was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_price
        @price = Price.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def price_params
        params.require(:price).permit(:name, :value, :session_duration, :section_id, :from, :not_other_discounts)
      end
  end
end
