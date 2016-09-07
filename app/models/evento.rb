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

end
