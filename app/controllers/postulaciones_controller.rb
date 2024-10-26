class PostulacionesController < ApplicationController
  before_action :authenticate_user!

  def index
    @postulaciones = current_user.postulaciones.includes(:oferta_laboral)
  end

  def create
    @oferta_laboral = OfertaLaboral.find(params[:oferta_laboral_id])
    @postulacion = current_user.postulaciones.new(oferta_laboral: @oferta_laboral)

    if @postulacion.save
      # Aquí puedes agregar lógica para enviar un correo a Esteban si es necesario.
      redirect_to postulaciones_user_path(current_user), notice: 'Te has postulado con éxito.'
    else
      render :new # O maneja el error según sea necesario
    end
  end
end