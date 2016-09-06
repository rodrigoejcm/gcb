class Publicacao < ApplicationRecord
  belongs_to :usuario
  mount_uploader :image, PostImagesUploader
end
