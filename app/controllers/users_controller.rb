class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    # Verificar si hay cambios en los parámetros permitidos
    if user_params.except(:password, :password_confirmation).values.all?(&:blank?)
      redirect_to edit_user_path(@user), alert: 'No se han realizado cambios en el perfil. Por favor, actualiza algún campo para continuar.'
    else
      # Intenta actualizar el usuario excluyendo el current_password
      if @user.update(user_params.except(:current_password))
        respond_to do |format|
          format.html { redirect_to edit_user_path(@user), notice: 'Perfil actualizado con éxito.' }
        end
      else
        respond_to do |format|
          format.html { render :edit }
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nombre_completo, :foto_perfil, :cv, :password, :password_confirmation)
  end
end
