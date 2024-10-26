class AddProfileFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :nombre_completo, :string
    add_column :users, :foto_perfil, :string
    add_column :users, :cv, :string
  end
end
