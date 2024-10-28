class AddContactFieldsToOfertaLaborals < ActiveRecord::Migration[7.2]
  def change
    add_column :oferta_laborals, :numero_contacto, :integer
    add_column :oferta_laborals, :correo_contacto, :string
  end
end
