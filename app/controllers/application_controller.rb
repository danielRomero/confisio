class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_section_by_permalink
    @section = Section.find_by(permalink: params[:section_permalink])
  end
end
