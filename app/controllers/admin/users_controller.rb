class Admin::UsersController < Admin::AdminsController
  before_action :set_user

  def update
    if @user.update(user_params)
      redirect_to admin_admin_path, notice: "Usuario #{@user.name} actualizado."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :surname,
      :password,
      :password_confirmation,
      :cv,
      :avatar_url,
      :contact_email,
      :contact_phone,
      :degree,
      :specialty,
      :google_plus_url,
      :section_id)
  end
end
