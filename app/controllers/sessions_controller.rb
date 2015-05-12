class SessionsController < ApplicationController
  
  skip_before_filter :login_required

  def create
    if params[:session] and params[:session][:email] and params[:session][:password]
      if user = User.find_by(email: params[:session][:email])
        if user.try(:authenticate, params[:session][:password])
          sign_in user
          apply_flash('success', "Bienvenido #{current_user.name}")
          if admin?
            redirect_to control_path
          else
            redirect_to user
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
      error400
    end
  end

  def destroy
    sign_out
    apply_flash('info', "Has cerrado la sesión")
    redirect_to root_path
  end
end
