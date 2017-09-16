class DiscountsController < ApplicationController
  def index
    @title = 'Descuentos'
    @sections = Section.includes(:discounts)
  end
end
