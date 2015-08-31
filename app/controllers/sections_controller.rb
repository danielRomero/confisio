class SectionsController < ApplicationController
  skip_before_filter :only_admin, only: [:show, :precios]
  skip_before_filter :login_required, only: [:show, :precios]
  
  before_action :set_section, only: [:show, :edit, :update, :destroy, :precios]
  def show
    @titulo = @section.name
    @description = @section.setting.description
  end
  
  def precios
    @setting = @section.setting
    @titulo = "#{@section.name} · precios"
  end
  private
    def set_section
      if !@section = Section.find_by(permalink: params[:permalink])
        redirect_to error_404_path if Rails.env.production?
      end
    end
end
