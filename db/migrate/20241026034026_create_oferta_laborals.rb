class CreateOfertaLaborals < ActiveRecord::Migration[7.2]
  def change
    create_table :oferta_laborals do |t|
      t.string :titulo
      t.text :descripcion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
