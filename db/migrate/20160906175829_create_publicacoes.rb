class CreatePublicacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :publicacoes do |t|
      t.string :titulo
      t.text :texto_publicacao
      t.references :usuario, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
