class PricesController < ApplicationController
  def index
    @title = 'Precios'
    @sections = Section.includes(:prices)
  end
end
