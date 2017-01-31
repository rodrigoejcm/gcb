class Local < ApplicationRecord
  belongs_to :usuario #responsável pelo cadastro
  has_many :turmas
  mount_uploader :imagem, LocalImagesUploader
  geocoded_by :endereco_completo
  after_validation :geocode, :if => ( :endereco_changed? || :pais_changed? )

  validates :nome, presence: true
  validates :endereco, presence: true
  validates :pais, presence: true


    def nome_pais
      paises_temp = CS.countries
      paises_temp.delete("BR")
      paises_temp[:BR] = "Brasil"
      return paises_temp[self.pais.to_sym]
  	end

    def endereco_completo
      return [self.endereco, self.cidade, self.estadoprovincia, self.nome_pais].reject{|s| s.blank?}.join(' ')
    end
 


end
