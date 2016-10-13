class HomeController < ApplicationController
  
  def index
  	@ultimos_eventos = Evento.where(aprovado: "APROVADO").where('data_hora_inicio > ?', DateTime.now).order(data_hora_inicio: :asc).limit(5)
  	#@ultimas_publicacoes = Publicacao.where(aprovado: true).limit(3)

  	@ultimas_publicacoes = Publicacao.where(aprovado: "APROVADO").order(created_at: :desc).limit(5)

  	

  	#if !usuario_signed_in?
  		#redirect_to new_usuario_session_path
  	#end
  end

  def sobre
  		
  end

end
