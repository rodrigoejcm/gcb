class Evento < ApplicationRecord
  belongs_to :usuario 
  mount_uploader :image, ImageUploader
end
