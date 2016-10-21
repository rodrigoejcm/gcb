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








end
