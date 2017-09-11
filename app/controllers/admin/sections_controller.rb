module Admin
  class SectionsController < AdminController
    before_action :set_section, only: [:show, :edit, :update, :destroy]

    def index
      @sections = Section.all.ordered
    end

    def new
      @section = Section.new
    end

    def edit
    end

    def create
      @section = Section.new(section_params)

      if @section.save
        redirect_to admin_sections_path, notice: 'Section was successfully created.'
      else
        render :new
      end
    end

    def update
      if @section.update(section_params)
        redirect_to edit_admin_section_path(@section), notice: 'Section was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @section.destroy
      redirect_to admin_sections_url, notice: 'Section was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_section
        @section = Section.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def section_params
        params.require(:section).permit(:title, :body, :banner, :banner_cache, :remove_banner)
      end
  end
end
