class UsersController < ApplicationController
  
  before_action :set_user

  def update
    if @user.update(user_params)
      redirect_to settings_path, notice: "Usuario #{@user.name} actualizado."
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
