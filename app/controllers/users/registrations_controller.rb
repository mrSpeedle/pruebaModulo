class Users::RegistrationsController < Devise::RegistrationsController
  # Deshabilitar el registro
  def new
    redirect_to root_path, alert: 'No tienes permiso para registrarte.'
  end

  def create
    redirect_to root_path, alert: 'No tienes permiso para registrarte.'
  end

  protected

  def update_resource(resource, params)
    if params[:current_password].present?
      resource.update_with_password(params)
    else
      resource.update_without_password(params.except(:current_password))
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nombre_completo, :foto_perfil, :cv)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :nombre_completo, :foto_perfil, :cv)
  end
end