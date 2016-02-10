class Admin::AppConfigurationsController < Admin::AdminsController
  before_action :set_app_configuration

  def update
    if @app_configuration.update(app_configuration_params)
      redirect_to edit_admin_app_configuration_path(@app_configuration), notice: 'App configuration was successfully updated.'
    else
      render :edit
    end
  end

  private

  def app_configuration_params
    params.require(:app_configuration).permit(
      :description,
      :telefono_movil,
      :telefono_fijo,
      :calle,
      :numero,
      :cp,
      :metro,
      :bus_lines,
      :barrio,
      :ciudad,
      :email,
      landing_images: [])
  end
end
