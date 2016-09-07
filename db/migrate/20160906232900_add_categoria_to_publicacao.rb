class AddCategoriaToPublicacao < ActiveRecord::Migration[5.0]
  def change
    add_reference :publicacoes, :categoria, foreign_key: true
  end
end
