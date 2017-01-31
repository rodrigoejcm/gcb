class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :configure_permitted_parameters, if: :devise_controller?

	############CONFIGURACAO ACTIVE ADMIN
	def authenticate_active_admin_user!
	   authenticate_usuario!

	   unless current_usuario.role == :admin.to_s
	      flash[:alert] = "Você não está autorizado para acessar essa área!"
	      redirect_to root_path
	   end
	end
	############END CONFIGURACAO ACTIVE ADMIN

	############CONFIGURACOES CANCAN
	
	#overridig current_user por current usuario para o cancan
	def current_ability
  		@current_ability ||= Ability.new(current_usuario)
	end

	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_path, :alert => exception.message
  	end
  	
  	############END CONFIGURACOES CANCAN

  	#Definerestrições para exibir sidebar_usuario
  	def exibe_sidebar_usuario?
  		if 
		(controller_name == 'eventos' && action_name == 'public_evento') ||
		(controller_name == 'eventos' && action_name == 'public_proximos_eventos') ||
		(controller_name == 'eventos' && action_name == 'public_proximos_eventos_sem_local') ||
		(controller_name == 'eventos' && action_name == 'public_proximos_eventos_local') ||
		(controller_name == 'eventos' && action_name == 'public_proximos_eventos_usuario') ||
		(controller_name == 'eventos' && action_name == 'public_proximos_eventos_data') ||
		(controller_name == 'publicacoes' && action_name == 'public_publicacao') ||
		(controller_name == 'publicacoes' && action_name == 'public_publicacoes') ||
		(controller_name == 'geolocalizacoes' && action_name == 'index') ||
		(controller_name == 'geolocalizacoes' && action_name == 'index_local') ||
		controller_name == 'home' || 

		!usuario_signed_in?

            return false

        else

        	return true

       	end
  	end


  	#implementacao em paralelo - mostra apaenas para o admin
  	def exibe_para_usuario?
  		if usuario_signed_in?
  			if current_usuario.admin?
  				return true
  			else
  				return false
  			end
  		else
  			return false
  		end
  	end


  	def pagina_perfil_publica?
  		if (controller_name == 'perfis' && action_name == 'public_show')
  			return true
  		else
  			return false
  		end
  	end	

	def listaProfessores
		#REFATORAR - REMOVER DAQUI e INCLUIR NO REGISTRATION CONTROLLER DO DEVISE

		professores = Hash.new

		Usuario.where(approved: true).where.not(role: "Admin").where("confirmed_at is not null ").each do |prof|
			professores[prof.apelido] = prof.apelido
		end

		

		return professores.sort
	end


  	##### HELPER METHODS
	
	helper_method :exibe_sidebar_usuario?,:pagina_perfil_publica?,:listaProfessores

	##### END HELPER METHODS

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :sobrenome, :apelido, :sexo, :graduacao, :nome_professor, :termo])
		devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :sobrenome, :apelido, :sexo, :graduacao, :nome_professor, :current_password, :telefone])
	end

end
