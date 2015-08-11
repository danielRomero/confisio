class SessionsController < ApplicationController
  skip_before_filter :login_required
  skip_before_filter :only_admin
  
  def create
    if params[:session] and params[:session][:email] and params[:session][:password]
      if user = User.find_by(email: params[:session][:email])
        if user.try(:authenticate, params[:session][:password])
          sign_in user
          apply_flash('success', "Bienvenido #{current_user.name}")
          if admin?
            redirect_to settings_path
          else
            #redirect_to user
            redirect_to root_path
          end
        else
          apply_flash('warning', 'Usuario o contraseña inválidos')
          render 'new'
        end
      else
        apply_flash('warning', 'Usuario no encontrado')
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def logout
    sign_out
    apply_flash('info', "Has cerrado la sesión")
    redirect_to root_path
  end
end
