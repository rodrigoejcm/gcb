json.extract! publicacao, :id, :titulo, :texto_publicacao, :usuario_id, :image, :created_at, :updated_at
json.url publicacao_url(publicacao, format: :json)