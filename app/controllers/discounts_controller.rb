class DiscountsController < ApplicationController
  skip_before_filter :only_admin, only: [:show, :index]
  skip_before_filter :login_required, only: [:show, :index]
  before_action :set_section
  before_action :set_discount, only: [:edit, :update, :show, :destroy]
  
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

  def new
    @discount = @section.discounts.build
  end
  
  def create
    @discount = @section.discounts.build
    if @discount.update(discount_params)
      redirect_to discounts_path(@section.permalink), notice: "Descuento creado."
    else
      render :edit
    end
  end
  
  def update
    if @discount.update(discount_params)
      redirect_to discounts_path(@section.permalink), notice: "Descuento actualizado."
    else
      render :edit
    end
  end

  def destroy
    if @discount.destroy
      redirect_to discounts_path(@section.permalink), notice: 'Descuento borrado'
    else
      redirect_to request.referer, notice: 'Descuento NO borrado, error.'
    end
  end
  
  private
    def set_section
      if !@section = Section.find_by(permalink: params[:permalink])
        redirect_to error_404_path
      end
    end
    def set_discount
      if !@discount = @section.discounts.find_by(permalink: params[:discount_permalink])
        redirect_to sections_permalink_path(@section.permalink)
      end
    end

    def discount_params
      params.require(:discount).permit(:title, :value, :description, :conditions, :id, :section_id)
    end
end
