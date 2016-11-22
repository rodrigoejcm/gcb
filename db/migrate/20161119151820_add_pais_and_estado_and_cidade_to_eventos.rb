class AddPaisAndEstadoAndCidadeToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :pais, :string
    add_column :eventos, :estadoprovincia, :string
    add_column :eventos, :cidade, :string
  end
end
