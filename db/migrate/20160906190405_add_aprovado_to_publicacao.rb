class AddAprovadoToPublicacao < ActiveRecord::Migration[5.0]
  def change
    add_column :publicacoes, :aprovado, :boolean
  end
end
