class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :precios, :discounts]
  def show
    @titulo = @section.name.capitalize
    @description = @section.setting.description || AppConfiguration.first.description
    @meta_url = sections_permalink_url(@section.permalink)
  end

  def precios
    @setting = @section.setting
    @titulo = "#{@section.name.capitalize} · Precios"
    @description = "Los mejores precios y descuentos en #{@section.name}"
    @meta_url = prices_url(@section.permalink)
  end

  def discounts
    @discounts = @section.discounts
    @titulo = "#{@section.name.capitalize} · descuentos"
    @meta_url = discounts_url(@section.permalink)
  end

  private

  def set_section
    unless @section = Section.find_by(permalink: params[:permalink])
      redirect_to error_404_path if Rails.env.production?
    end
  end
end
