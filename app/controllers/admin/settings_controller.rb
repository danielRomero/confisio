class Admin::SettingsController < Admin::AdminsController
  before_action :set_setting

  def update
    if @setting.update(setting_params)
      redirect_to edit_admin_setting_path, notice: "#{@section.name} configuration was successfully updated."
    else
      render :edit
    end
  end

  def edit
    @titulo = "Configuración de #{@section.name}"
  end

  private

  def set_setting
    @setting = @section.setting
  end

  def setting_params
    params.require(:setting).permit(:meta_keywords, :base_price, :email, :description, :id)
  end
end
