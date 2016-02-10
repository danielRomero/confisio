class FreeCallsController < ApplicationController

  def create
    free_call = FreeCall.new(free_call_params)
    if free_call.save
      redirect_to request.referer, notice: 'Hemos registrado tu petición. Te llamaremos cuanto antes, muchas gracias.'
    else
      render :edit
    end
  end

  private

  def set_free_call
    unless @free_call = FreeCall.find_by(id: params[:id])
      redirect_to root_path
    end
  end

  def free_call_params
    params.require(:free_call).permit(:phone, :name, :section_id)
  end
end
