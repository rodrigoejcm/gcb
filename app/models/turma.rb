class Turma < ApplicationRecord
  belongs_to :local
  #has_one :local
  belongs_to :usuario #default: responsavel pelo cadastro, alterado, reponsável pela turma

  validates :local_id, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fim, presence: true


  def dias_da_semana

  	dias = []
  	dias.push("dom") if self.dia_dom
    dias.push("seg") if self.dia_seg
  	dias.push("ter") if self.dia_ter
  	dias.push("qua") if self.dia_qua
  	dias.push("qui") if self.dia_qui
  	dias.push("sex") if self.dia_sex
  	dias.push("sab") if self.dia_sab
  	

  	return dias.join(" / ") 

  end

  def horario_da_turma
  	
  	inicio = I18n.localize self.hora_inicio, format: :hora_minuto
  	fim = I18n.localize self.hora_fim, format: :hora_minuto

  	return inicio + " - " + fim

  end

end
