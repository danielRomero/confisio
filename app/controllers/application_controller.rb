class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :login_required, except: [:index, :sitemap, :contact, :team]
  include SessionsHelper

  def index
    @app_configuration = AppConfiguration.last
    render layout: 'landing'
  end

  def contact
    @app_configuration = AppConfiguration.first
  end

  # Type can be: info, success, warning, danger
  def apply_flash(type='info', message='')
    flash[:application] ||= []
    flash[:application] << {type: type, message: message}.with_indifferent_access
  end

  private
    def login_required
      if signed_in?
        return true
      else
        apply_flash(type='warning', message='No tienes permisos para acceder a esta sección')
        redirect_to root_path
      end
    end

    def only_admin
      if admin?
        return true
      else
        apply_flash(type='warning', message='No tienes permisos para acceder a esta sección')
        redirect_to root_path
      end
    end
end
