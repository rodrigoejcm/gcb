class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def authenticate_active_admin_user!
	   authenticate_usuario!

	   unless current_usuario.role == :admin.to_s
	      flash[:alert] = "Você não está autorizado para acessar essa área!"
	      redirect_to root_path
	   end
	end

	#overridig current_user por current usuario para o cancan
	def current_ability
  		@current_ability ||= Ability.new(current_usuario)
	end

	



	

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :sobrenome, :apelido, :sexo, :graduacao, :nome_professor])
		devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :sobrenome, :apelido, :sexo, :graduacao, :nome_professor, :current_password])
	end

end
