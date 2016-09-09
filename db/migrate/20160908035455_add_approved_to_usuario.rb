class AddApprovedToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :approved, :boolean
    add_index  :usuarios, :approved
  end
end
