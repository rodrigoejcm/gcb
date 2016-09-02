class HomeController < ApplicationController
  
  def index
  	@ultimos_eventos = Evento.limit(5)	

  	#if !usuario_signed_in?
  		#redirect_to new_usuario_session_path
  	#end
  end

end
