class UsuariosController < ApplicationController
	 before_action :set_usuario, only: [:aprovar_usuario, :bloquear_usuario]


	def aprovar_usuario

	  @usuario.approved = true

      respond_to do |format|
        if @usuario.update(usuario_params)
          format.html { redirect_to aprovacoes_path(tab: "apro_usuarios"), notice: 'Usuário Aprovado com sucesso.' }
          format.json { render :show, status: :ok, location: @usuario }
        else
          format.html { render :edit }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    	
	end

  def bloquear_usuario

    @usuario.approved = false

      respond_to do |format|
        if @usuario.update(usuario_params)
          format.html { redirect_to aprovacoes_path(tab: "apro_usuarios"), notice: 'Usuário Bloqueado com sucesso.' }
          format.json { render :show, status: :ok, location: @usuario }
        else
          format.html { render :edit }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
  end

  def lista_usuarios
    @usuarios = Usuario.where(approved: :true).order(:apelido)
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.permit(:id) # List here whitelisted params

    end

end