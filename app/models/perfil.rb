class Perfil < ApplicationRecord
  belongs_to :usuario
  mount_uploader :imagemPerfil, PerfilImagesUploader
  mount_uploader :imagemCapa, PerfilImagesCapaUploader


def possuiImagem?
  	!self.imagemPerfil.blank?
end

def possuiDescricao?
  	!self.descricao.blank?
end

def possuiImagemCapa?
  	!self.imagemCapa.blank?
end

def possuiDataCap?
  	!self.datacap.blank?
end

def possuiDataGcb?
  	!self.datagcb.blank?
end

def possuiCorda?
  	!self.corda.blank?
end

def cordaCapoeira
	if possuiCorda?
		if self.corda == 'Azul'
			return ['Azul', '#003366']
		elsif self.corda == 'Verde'
			return ['Verde' , '#006600']
		elsif self.corda == 'Roxa'
			return ['Roxa' , '#330066']
		elsif self.corda == 'Marrom'
			return ['Marrom' , '#330000']
		elsif self.corda == 'Preta'
			return ['Preta' , '#000000']
		end
	else
		return ['Usuário ainda não incluiu a corda que possui.' , 'white'] 
	end
end

def dataInicioCapoeira
	if possuiDataCap?
		return I18n.localize self.datacap, format: :nome_mes_ano
	else
		return "Usuário ainda não incluiu a data que iniciou a praticar capoeira."
	end
end

def dataInicioGCB
	if possuiDataGcb?
		return I18n.localize self.datagcb, format: :nome_mes_ano
	else
		return "Usuário ainda não incluiu a data que iniciou no Grupo."
	end
end









end
