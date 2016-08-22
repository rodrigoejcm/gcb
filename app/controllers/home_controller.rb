class HomeController < ApplicationController
  def index
  	if !usuario_signed_in?
  		redirect_to new_usuario_session_path
  	end
  end
end
