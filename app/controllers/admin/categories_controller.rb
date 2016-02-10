class Admin::CategoriesController < Admin::AdminsController
  before_action :set_category, except: [:index, :create, :new]

  def show
    @titulo = "#{@section.name.capitalize} · #{@category.name}"
  end

  def index
    @titulo = "#{@section.name.capitalize} · categorías"
    @categories = @section.categories.page params[:page]
  end

  def new
    @category = @section.categories.build
  end

  def create
    @category = Category.new category_params
    if @section.categories << @category
      redirect_to admin_categories_path, notice: 'Categoría creada.'
    else
      render :edit
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Categoría actualizada.'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: 'Categoría borrada'
    else
      redirect_to request.referer, notice: 'Categoría NO borrada, error.'
    end
  end

  private

  def set_category
    unless @category = @section.categories.find_by(id: params[:id])
      redirect_to admin_categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :description, :id)
  end
end
