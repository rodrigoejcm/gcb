class Publicacao < ApplicationRecord
  	belongs_to :usuario
  	belongs_to :categoria
  	mount_uploader :image, PostImagesUploader

  	def status_aprovacao
  		if self.aprovado == "APROVADO"
  			return "A Publicação foi aprovada."
  		elsif self.aprovado == "REPROVADO" 
  			return "A Publicação não foi aprovada."
  		else
  			return "A Publicação ainda não foi aprovada."
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
