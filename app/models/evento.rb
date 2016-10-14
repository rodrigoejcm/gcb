class Evento < ApplicationRecord
  	belongs_to :usuario 
  	mount_uploader :image, ImageUploader


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
