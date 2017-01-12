class AddTelefoneToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :telefone, :string
  end
end
