class CreatePostulacions < ActiveRecord::Migration[7.2]
  def change
    create_table :postulacions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :oferta_laboral, null: false, foreign_key: true

      t.timestamps
    end
  end
end
