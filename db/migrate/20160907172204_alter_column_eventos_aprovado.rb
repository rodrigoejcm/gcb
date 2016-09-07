class AlterColumnEventosAprovado < ActiveRecord::Migration[5.0]
  def change
    change_column :eventos, :aprovado, :string, :default => ''
  end
end
