class PostulacionMailer < ApplicationMailer
  default from: 'notificaciones@tuempresa.com'

  def nueva_postulacion(postulacion)
    @postulacion = postulacion
    @oferta_laboral = @postulacion.oferta_laboral # Asumiendo que la postulación tiene una relación con la oferta laboral

    mail(to: 'testuliotrivino@gmail.com', subject: 'Nueva Postulación Recibida')
  end
end