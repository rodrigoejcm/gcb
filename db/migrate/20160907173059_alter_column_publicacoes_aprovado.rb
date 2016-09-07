class AlterColumnPublicacoesAprovado < ActiveRecord::Migration[5.0]
  def change
    change_column :publicacoes, :aprovado, :string, :default => ''
  end
end
