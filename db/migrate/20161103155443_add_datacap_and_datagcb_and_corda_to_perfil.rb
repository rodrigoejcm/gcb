class AddDatacapAndDatagcbAndCordaToPerfil < ActiveRecord::Migration[5.0]
  def change
    add_column :perfis, :datacap, :date
    add_column :perfis, :datagcb, :date
    add_column :perfis, :corda, :string
  end
end
