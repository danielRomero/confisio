class Admin::AdminsController < ApplicationController
  before_filter :only_admin
  before_filter :set_section
  layout 'admin'

  def index
  end

  private

  def set_section
    @section = current_user.section || Section.first
  end
end
