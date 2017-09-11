class PricesController < ApplicationController
  def index
    @sections = Section.includes(:prices)
  end
end
