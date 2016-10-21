class CreatePerfis < ActiveRecord::Migration[5.0]
  def change
    create_table :perfis do |t|
      t.string :imagemPerfil
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
