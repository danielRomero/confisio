class ReleaseSuscriptionsController < ApplicationController
  def create
    ReleaseSuscription.create!(release_suscription_params)
    redirect_to root_path, notice: 'Te has suscrito correctamente, pronto recibirás noticias y promociones exclusivas.'
  end

  private
  def release_suscription_params
    params.require(:release_suscription).permit(:email)
  end
end