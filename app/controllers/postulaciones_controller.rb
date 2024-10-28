class PostulacionesController < ApplicationController
  before_action :authenticate_user!

  def index
    @postulaciones = current_user.postulaciones.includes(:oferta_laboral)
  end

  def create
    @oferta_laboral = OfertaLaboral.find(params[:ofertas_laborale_id])
    @postulacion = current_user.postulaciones.new(oferta_laboral: @oferta_laboral)

    if current_user.cv.attached?
      @postulacion.cv.attach(current_user.cv.blob)
    end

    if @postulacion.save
      PostulacionMailer.nueva_postulacion(@postulacion).deliver_now
      # Redirige a la lista de postulaciones del usuario
      redirect_to user_postulaciones_path(current_user), notice: 'Te has postulado con éxito.'
    else
      Rails.logger.error(@postulacion.errors.full_messages) # Log de errores
      redirect_to ofertas_laborales_path, alert: 'Error al realizar la postulación.'
    end
  end

  private

  def postulacion_params
    params.require(:postulacion).permit(:cv) # Asegúrate de permitir los parámetros necesarios
  end
end