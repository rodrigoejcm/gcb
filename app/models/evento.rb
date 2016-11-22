# == Schema Information
#
# Table name: eventos
#
#  id               :integer          not null, primary key
#  titulo           :string(150)
#  descricao        :text
#  local            :string
#  data_hora_inicio :datetime
#  data_hora_fim    :datetime
#  aprovado         :string           default("INDEFINIDO")
#  usuario_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image            :string
#  pais             :string
#  estadoprovincia  :string
#  cidade           :string
#

class Evento < ApplicationRecord
    include Bootsy::Container
  	belongs_to :usuario 
  	mount_uploader :image, ImageUploader

    validates :titulo, presence: true
    validates :titulo, presence: true
    validates :data_hora_inicio, presence: true
    validates :data_hora_fim, presence: true
    
    extend TimeSplitter::Accessors
    split_accessor :data_hora_inicio,:data_hora_fim


	def status_aprovacao
  		if self.aprovado == "APROVADO"
  			return "O Evento foi aprovado."
  		elsif self.aprovado == "REPROVADO" 
  			return "O Evento não foi aprovado."
  		else
  			return "O Evento ainda não foi aprovado."
  		end
	end

  def status_aprovacao_cor
      if self.aprovado == "APROVADO"
        return "label-success"
      elsif self.aprovado == "REPROVADO" 
        return "label-danger"
      else
        return "label-warning"
      end
  end

 

end
