module Admin
  class DiscountsController < AdminController
    before_action :set_discount, only: [:show, :edit, :update, :destroy]

    def index
      @discounts = Discount.order_by_section.includes(:section)
    end

    def new
      @discount = Discount.new
    end

    def edit
    end

    def create
      @discount = Discount.new(discount_params)

      if @discount.save
        redirect_to @discount, notice: 'Discount was successfully created.'
      else
        render :new
      end
    end

    def update
      if @discount.update(discount_params)
        redirect_to @discount, notice: 'Discount was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @discount.destroy
      redirect_to discounts_url, notice: 'Discount was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_discount
        @discount = Discount.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def discount_params
        params.require(:discount).permit(:section_id, :title, :valid_to, :value, :description, :conditions)
      end
  end
end
