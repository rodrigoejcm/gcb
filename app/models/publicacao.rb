class Publicacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :categoria
  mount_uploader :image, PostImagesUploader
end
