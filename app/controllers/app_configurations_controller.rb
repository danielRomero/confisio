class AppConfigurationsController < ApplicationController
  
  before_action :set_app_configuration, only: [:edit, :update]
  
  def update
    if @app_configuration.update(app_configuration_params)
      redirect_to edit_app_configuration_path(@app_configuration), notice: 'App configuration was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_app_configuration
      @app_configuration = AppConfiguration.find(params[:id])
    end

    def app_configuration_params
      params.require(:app_configuration).permit(:telefono_movil, :telefono_fijo, :calle, :numero, :cp, :ciudad, :email, { landing_images: [] })
    end
end
