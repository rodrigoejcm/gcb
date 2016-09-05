class AddRoleToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :role, :string
  end
end
