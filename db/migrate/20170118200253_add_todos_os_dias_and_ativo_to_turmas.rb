class AddTodosOsDiasAndAtivoToTurmas < ActiveRecord::Migration[5.0]
  def change
    add_column :turmas, :dia_seg, :boolean
    add_column :turmas, :dia_ter, :boolean
    add_column :turmas, :dia_qua, :boolean
    add_column :turmas, :dia_qui, :boolean
    add_column :turmas, :dia_sex, :boolean
    add_column :turmas, :dia_sab, :boolean
    add_column :turmas, :dia_dom, :boolean
    add_column :turmas, :turma_ativa, :boolean
  end
end
