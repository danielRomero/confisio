class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :login_required, except: [:index, :sitemap]
  
  include SessionsHelper
  
  # Generic error
  def error(message='Algo salió mal, inténtalo de nuevo', type='warning')
    respond_to do |format|
      format.html {
        @title = 'Error'
        @message = message
        render :template => 'application/error_404'
      }
      format.js {
        apply_flash(type, message)
        render :partial => 'application/flashes'
      }
    end
  end

  # Bad request
  def error400(message='La petición no se ha podido procesar')
    respond_to do |format|
      format.html {
        @title = '400 Bad request'
        @message = message
        render :template => 'application/error_404'
      }
      format.js {
        apply_flash('warning', message)
        render :partial => 'application/flashes'
      }
    end
  end

  # Not found
  def error404(message='La página solicitada no existe.')
    respond_to do |format|
      format.html {
        @title = '404 Not found'
        @message = message
        render :template => 'application/error_404'
      }
      format.js {
        apply_flash('warning', message)
        render :partial => 'application/flashes'
      }
    end
  end
  
  # Unauthorized
  def error401(message='No estas autorizado para acceder a esta sección.')
    respond_to do |format|
      format.html {
        @title = '401 Unauthorized'
        @message = message
        render :template => 'application/error_404'
      }
      format.js {
        apply_flash('warning', message)
        render :partial => 'application/flashes'
      }
    end
  end

  # Type can be: info, success, warning, danger
  def apply_flash(type='info', message='')
    flash[:application] ||= []
    flash[:application] << {type: type, message: message}.with_indifferent_access
  end

  private
    def login_required
      logger.debug "LOGIN REQUIRED!!!!"
      if signed_in?
        return true
      else
        apply_flash(type='warning', message='No tienes permisos para acceder a esta sección')
        redirect_to root_path
      end
    end

    def only_admin
      logger.debug "ADMIN REQUIRED!!!!"
      if admin?
        return true
      else
        error401
      end
    end

end
