class OfertasLaboralesController < ApplicationController
  before_action :authenticate_user! # Asegúrate de que el usuario esté autenticado
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_oferta_laboral, only: [:show, :edit, :update, :destroy]

  def index
    @ofertas_laborales = OfertaLaboral.page(params[:page]).per(10)
    
  end

  def show
    @oferta = OfertaLaboral.find(params[:id]) # Esto está correcto
  end
  
  def new
    @oferta_laboral = OfertaLaboral.new
  end

  def create
    @oferta_laboral = OfertaLaboral.new(oferta_laboral_params)
    @oferta_laboral.user = current_user # Asignar el usuario actual como creador de la oferta

    if @oferta_laboral.save
      redirect_to ofertas_laborale_path(@oferta_laboral), notice: 'Oferta laboral creada exitosamente.'
    else
      render :new
    end
  end

  def edit
    @oferta_laboral = OfertaLaboral.find(params[:id])
  end
  
  def update
    
    if @oferta_laboral.update(oferta_laboral_params)
      redirect_to ofertas_laborale_path(@oferta_laboral), notice: 'Oferta laboral actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @oferta_laboral.destroy
    redirect_to ofertas_laborales_path, notice: 'Oferta laboral eliminada exitosamente.'
  end

  private

  # Método para verificar si el usuario es administrador
  def check_admin
    redirect_to root_path, alert: 'No tienes permiso para realizar esta acción.' unless current_user.admin?
  end

  # Método para establecer la oferta laboral actual
  def set_oferta_laboral
    @oferta_laboral = OfertaLaboral.find(params[:id])
  end

  # Permitir parámetros específicos para las ofertas laborales
  def oferta_laboral_params
    params.require(:oferta_laboral).permit(:titulo, :descripcion, :empresa, :numero_contacto, :correo_contacto)
  end
end