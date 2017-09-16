class SectionsController < ApplicationController
  before_action :set_section_by_permalink

  def show
    @title = @section.title.capitalize
  end

  def prices
    @sections = Section.ordered
    @title = "Precios en #{@section.title}"
    render 'prices/index'
  end

  def discounts
    @sections = Section.ordered
    @title = "Descuentos en #{@section.title}"
    render 'discounts/index'
  end
end
