class UsersController < ApplicationController
  
  skip_before_filter :only_admin, only: [:employee, :team]
  skip_before_filter :login_required, only: [:employee, :team]

  before_action :set_user, except: [:team, :employee]
  before_action :set_employee, only: [:employee]

  def update
    if @user.update(user_params)
      redirect_to settings_path, notice: "Usuario #{@user.name} actualizado."
    else
      render :edit
    end
  end

  def team
    @titulo = 'Equipo'
    @description = "Conoce al equipo de #{APP_NAME} y contacta con quien necesites. Profesionales cualificados con experiencia en constante formación para ofrecerte el mejor servicio."
    @meta_url = team_url
  end

  def employee
    @titulo = @employee.full_name
    @description = "#{@employee.full_name}. #{@employee.degree}. #{@employee.specialty}. #{@employee.cv[0..300]} ..."
    @meta_url = employee_path(@employee.section.permalink, @employee.permalink)
    @meta_image = @employee.avatar_url
    @app_configuration = AppConfiguration.last
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_employee
      if !(@employee = User.employers.find_by(permalink: params[:employee_permalink]))
        redirect_to team_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :surname, :password, :password_confirmation, :cv, :avatar_url, :contact_email, :contact_phone, :degree, :specialty, :google_plus_url, :section_id)
    end
end