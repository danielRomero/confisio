class Admin::FreeCallsController < Admin::AdminsController
  before_action :set_free_call, except: [:index]

  def index
    @free_calls = FreeCall.page params[:page]
    @titulo = 'Te llamamos gratis'
  end

  def update
    if @free_call.update(free_call_params)
      redirect_to request.referer, notice: 'Llamada actualizado.'
    else
      render :edit
    end
  end

  def destroy
    @free_call.destroy
    redirect_to request.referer, notice: 'Llamada borrada.'
  end

  private

  def set_free_call
    unless @free_call = FreeCall.find_by(id: params[:id])
      redirect_to admin_free_calls_path
    end
  end

  def free_call_params
    params.require(:free_call).permit(:id, :phone, :name, :section_id, :status)
  end
end
