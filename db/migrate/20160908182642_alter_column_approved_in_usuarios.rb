class AlterColumnApprovedInUsuarios < ActiveRecord::Migration[5.0]
  def change
  	change_column :usuarios, :approved, :boolean, :default => false
  end
end
