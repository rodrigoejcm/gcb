class CreateTurmas < ActiveRecord::Migration[5.0]
  def change
    create_table :turmas do |t|
      t.references :local, foreign_key: true
      t.references :usuario, foreign_key: true
      t.string :dias
      t.string :periodo
      t.time :hora_inicio
      t.time :hora_fim
      t.string :publico
      t.text :observacoes

      t.timestamps
    end
  end
end
