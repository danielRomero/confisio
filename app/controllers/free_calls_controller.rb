class FreeCallsController < ApplicationController

  def create
    FreeCall.create(free_call_params)
    redirect_to request.referer, notice: 'Hemos registrado tu petición. Te llamaremos cuanto antes, muchas gracias.'
  end

  private

  def free_call_params
    params.require(:free_call).permit(:section_id, :name, :phone)
  end
end
