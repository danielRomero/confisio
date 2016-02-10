class CategoriesController < ApplicationController
  before_action :set_section
  before_action :set_category

  def show
    @titulo = "#{@section.name.capitalize} · #{@category.name}"
    @description = @category.description || AppConfiguration.first.description
    @meta_url = category_url(@section.permalink, @category.permalink)
  end

  private

  def set_category
    unless @category = @section.categories.find_by(permalink: params[:category_permalink])
      redirect_to categories_path(@section.permalink)
    end
  end

  def set_section
    !@section = Section.find_by(permalink: params[:permalink])
  end
end
