class AlterColumnEventosAndPublicacoesAprovadoDefault < ActiveRecord::Migration[5.0]
  def change
  	 change_column :publicacoes, :aprovado, :string, :default => 'INDEFINIDO'
  	 change_column :eventos, :aprovado, :string, :default => 'INDEFINIDO'
  end
end
