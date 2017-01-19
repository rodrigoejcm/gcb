class CreateLocais < ActiveRecord::Migration[5.0]
  def change
    create_table :locais do |t|
      t.string :nome
      t.text :descricao
      t.string :endereco
      t.string :cidade
      t.string :estadoprovincia
      t.string :pais
      t.string :contato1
      t.string :contato2
      t.string :imagem
      t.string :mapa
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
