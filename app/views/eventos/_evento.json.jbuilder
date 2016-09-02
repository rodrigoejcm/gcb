json.extract! evento, :id, :titulo, :descricao, :local, :data_hora_inicio, :data_hora_fim, :aprovado, :usuario_id, :created_at, :updated_at
json.url evento_url(evento, format: :json)