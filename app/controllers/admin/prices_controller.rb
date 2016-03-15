class Admin::PricesController < Admin::AdminsController
  before_action :set_price, except: [:index, :new, :create]

  def index
    @titulo = "#{@section.name.capitalize} · precios"
    @prices = @section.prices.page params[:page]
  end

  def new
    @price = @section.prices.build
  end

  def edit
  end

  def create
    @price = Price.new
    @price.section = @section
    if @price.update(price_params)
      redirect_to admin_prices_path, notice: 'Precio creado.'
    else
      render :edit
    end
  end

  def update
    if @price.update(price_params)
      redirect_to admin_prices_path, notice: 'Precio actualizado.'
    else
      render :edit
    end
  end

  def destroy
    if @price.destroy
      redirect_to admin_prices_path, notice: 'Precio borrado'
    else
      redirect_to request.referer, notice: 'Precio NO borrado, error.'
    end
  end

  private

  def set_price
    @price = Price.find params[:id]
  end

  def price_params
    params.require(:price).permit(:duration, :value, :name, :unit_name, :id)
  end
end
