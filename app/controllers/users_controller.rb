class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if user_params.except(:password, :password_confirmation).values.all?(&:blank?)
      redirect_to edit_user_path(@user), alert: 'No se han realizado cambios en el perfil. Por favor, actualiza algún campo para continuar.'
    else
      if @user.update(user_params)
        redirect_to edit_user_path(@user), notice: 'Perfil actualizado con éxito.'
      else
        render :edit # Renderiza nuevamente la vista de edición si hay errores
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nombre_completo, :foto_perfil, :cv, :password, :password_confirmation, :current_password)
  end
end