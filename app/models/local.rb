class Local < ApplicationRecord
  belongs_to :usuario #responsável pelo cadastro
  has_many :turmas
  mount_uploader :imagem, LocalImagesUploader

  validates :nome, presence: true
  validates :endereco, presence: true
  validates :pais, presence: true


end
