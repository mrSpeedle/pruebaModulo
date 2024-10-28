class AddEmpresaToOfertaLaborals < ActiveRecord::Migration[7.2]
  def change
    add_column :oferta_laborals, :empresa, :string
  end
end
