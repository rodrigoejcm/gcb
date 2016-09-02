class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :titulo, limit: 150
      t.text :descricao
      t.string :local
      t.datetime :data_hora_inicio
      t.datetime :data_hora_fim
      t.boolean :aprovado
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
