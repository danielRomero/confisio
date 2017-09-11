module Admin
  class FreeCallsController < AdminController
    before_action :set_free_call, only: [:show, :edit, :update, :destroy]

    def index
      @free_calls = FreeCall.all.includes(:section).order_by_status
    end

    def update
      if @free_call.update(free_call_params)
        redirect_to admin_free_calls_path, notice: 'Free call was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @free_call.destroy
      redirect_to admin_free_calls_path, notice: 'Free call was successfully destroyed.'
    end

    private

    def set_free_call
      @free_call = FreeCall.find(params[:id])
    end

    def free_call_params
      params.require(:free_call).permit(:status)
    end
  end
end
