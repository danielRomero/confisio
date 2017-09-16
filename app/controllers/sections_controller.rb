class SectionsController < ApplicationController
  before_action :set_section_by_permalink
  def prices
    @sections = Section.ordered
    render 'prices/index'
  end

  def discounts
    @sections = Section.ordered
    render 'discounts/index'
  end
end
