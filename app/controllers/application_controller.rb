class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_app_configuration
  include SessionsHelper

  def index
    render layout: 'landing'
  end

  def contact
    @titulo = 'Contacto'
    @description = "Te resolvemos cualquier duda, contacta ahora con nosotros y recibe las mejores ofertas. #{@app_configuration.telefono_fijo} --- #{@app_configuration.email}"
    @meta_url = contact_url
  end

  def precios
    @titulo = 'Precios  / Tarifas'
    @meta_url = prices_url
  end

  # Type can be: info, success, warning, danger
  def apply_flash(type = 'info', message = '')
    flash[:application] ||= []
    flash[:application] << { type: type, message: message }.with_indifferent_access
  end

  private

  def login_required
    if signed_in?
      return true
    else
      apply_flash('warning', 'No tienes permisos para acceder a esta sección')
      redirect_to root_path
    end
  end

  def only_admin
    if admin?
      return true
    else
      apply_flash('warning', 'No tienes permisos para acceder a esta sección')
      redirect_to login_path
    end
  end

  def set_app_configuration
    @app_configuration = AppConfiguration.last
  end
end
