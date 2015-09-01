class CategoriesController < ApplicationController
  # layout 'application'
  skip_before_filter :only_admin, only: [:show, :index]
  skip_before_filter :login_required, only: [:show, :index]

  before_action :set_section
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def show
    @titulo = "#{@section.name} · #{@category.name}"
    @description = @category.description || AppConfiguration.first.description
    @meta_url = category_path(@section.permalink, @category.permalink)
  end

  def index
    @titulo = "#{@section.name} · categorías"
    if !admin?
      redirect_to sections_permalink_path(@section.permalink)
    end
  end

  def new
    @category = @section.categories.build
  end

  def create
    @category = @section.categories.build
    if @category.update(category_params)
      redirect_to categories_path(@section.permalink), notice: "Categoría creado."
    else
      render :edit
    end
  end
  
  def update
    if @category.update(category_params)
      redirect_to categories_path(@section.permalink), notice: "Categoría actualizada."
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path(@section.permalink), notice: 'Categoría borrada'
    else
      redirect_to request.referer, notice: 'Categoría NO borrada, error.'
    end
  end

  private
    def set_category
      if !@category = @section.categories.find_by(permalink: params[:category_permalink])
        redirect_to categories_path(@section.permalink)
      end
    end
    
    def set_section
      !@section = Section.find_by(permalink: params[:permalink])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
