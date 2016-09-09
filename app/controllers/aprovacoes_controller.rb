class AprovacoesController < ApplicationController
    load_and_authorize_resource :class => AprovacoesController
     
	def aprovacoes
			@tab = params[:tab]
            @publicacoes = Publicacao.all
            @usuarios = Usuario.where(approved: false)
            @eventos = Evento.all
	end


	


	

end
