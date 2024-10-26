class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nombre_completo, :foto_perfil, :cv)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :nombre_completo, :foto_perfil, :cv)
  end
end
