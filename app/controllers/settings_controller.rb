class SettingsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update]
  before_action :set_setting, only: [:show, :edit, :update]
  
  def show
    @posts = @section.posts.by_create_date
  end

  def update
    if @setting.update(setting_params)
      redirect_to setting_path(@section.permalink), notice: "#{@section.name} configuration was successfully updated."
    else
      render :edit
    end
  end

  private
    def set_section
      @section = Section.find_by(permalink: params[:permalink])
    end

    def set_setting
      @setting = @section.setting
    end

    def setting_params
      params.require(:setting).permit(:meta_keywords, :base_price, :email, :description)
    end
end
