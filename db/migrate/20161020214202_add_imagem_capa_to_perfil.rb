class AddImagemCapaToPerfil < ActiveRecord::Migration[5.0]
  def change
    add_column :perfis, :imagemCapa, :string
  end
end
