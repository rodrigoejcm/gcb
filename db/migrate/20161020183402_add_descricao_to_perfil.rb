class AddDescricaoToPerfil < ActiveRecord::Migration[5.0]
  def change
    add_column :perfis, :descricao, :text
  end
end
