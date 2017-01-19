class Turma < ApplicationRecord
  belongs_to :local
  belongs_to :usuario #default: responsavel pelo cadastro, alterado, reponsável pela turma

  validates :local_id, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fim, presence: true

end
