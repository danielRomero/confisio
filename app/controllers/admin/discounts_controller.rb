class Admin::DiscountsController < Admin::AdminsController
  before_action :set_section
  before_action :set_discount, except: [:index, :new, :create]

  def index
    @discounts = @section.discounts.page params[:page]
    @titulo = "#{@section.name.capitalize} · descuentos"
  end

  def new
    @discount = @section.discounts.build
  end

  def create
    @discount = Discount.new(discount_params)
    if @section.discounts << @discount
      redirect_to admin_discounts_path, notice: 'Descuento creado.'
    else
      render :edit
    end
  end

  def update
    if @discount.update(discount_params)
      redirect_to request.referer, notice: 'Descuento actualizado.'
    else
      render :edit
    end
  end

  def destroy
    if @discount.destroy
      redirect_to request.referer, notice: 'Descuento borrado'
    else
      redirect_to request.referer, notice: 'Descuento NO borrado, error.'
    end
  end

  private

  def set_discount
    unless @discount = @section.discounts.find_by(id: params[:id])
      admin_discounts_path
    end
  end

  def discount_params
    params.require(:discount).permit(:title, :value, :description, :conditions, :id, :section_id, :valid_to)
  end
end
