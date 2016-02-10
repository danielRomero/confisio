class DiscountsController < ApplicationController
  before_action :set_section
  before_action :set_discount, only: [:show]

  def index
    @discounts = @section.discounts
    @titulo = "#{@section.name.capitalize} · descuentos"
    @description = "Mira los últimos descuentos en #{@section.name}"
    @meta_url = discounts_url(@section.permalink)
  end

  def show
    @titulo = "#{@section.name.capitalize} · Descuentos · #{@discount.title}"
    @description = "Mira los últimos descuentos en #{@section.name}. #{@discount.title.capitalize}"
    @meta_url = discount_url(@section.permalink, @discount.permalink)
  end

  private

  def set_section
    unless @section = Section.find_by(permalink: params[:permalink])
      redirect_to error_404_path
    end
  end

  def set_discount
    unless @discount = @section.discounts.find_by(permalink: params[:discount_permalink])
      redirect_to sections_permalink_path(@section.permalink)
    end
  end
end
