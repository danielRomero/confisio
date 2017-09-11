class DiscountsController < ApplicationController
  def index
    @sections = Section.includes(:discounts)
  end
end
