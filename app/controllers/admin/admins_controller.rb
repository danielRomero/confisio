class Admin::AdminsController < ApplicationController
  before_filter :only_admin
  before_filter :set_section
  layout 'admin'

  def index
    unless admin?
      redirect_to login_path
    end
  end

  def change_section
    if is_super_admin? && (section = Section.find(params[:id]))
      session[:section_id] = section.id
    end
    redirect_to admin_admin_path
  end

  private

  def set_section
    @section = Section.find(session[:section_id] || current_user.section)
    session[:section_id] = @section.id
  end
end
