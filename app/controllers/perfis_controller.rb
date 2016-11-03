class PerfisController < ApplicationController

  before_action :set_perfil, only: [  :show, :incluir_foto, :alterar_foto, 
                                      :incluir_descricao, :alterar_descricao, 
                                      :incluir_foto_capa, :alterar_foto_capa, :update,
                                      :incluir_datas, :alterar_datas,
                                      :incluir_corda, :alterar_corda]

  before_action :set_perfil_by_id, only: [:public_show ]


  def show

  end

  def incluir_foto

  end

  def alterar_foto
    
  end

  def incluir_foto_capa

  end

  def alterar_foto_capa
    
  end

  def incluir_descricao
    
  end

  def alterar_descricao
    
  end

  def incluir_corda
    
  end

  def alterar_corda
    
  end

  def incluir_datas
    
  end

  def alterar_datas
    
  end

  def public_show
    @eventos =  Evento.where(aprovado: "APROVADO").where('data_hora_inicio > ?', DateTime.now).where(usuario: @perfil.usuario).order(data_hora_inicio: :asc).limit(5)
    @publicacoes = Publicacao.where(aprovado: "APROVADO").where(usuario: @perfil.usuario).limit(5)
  end


  # POST /perfis
  # POST /perfis.json
  def create
    @perfil = Perfil.new(perfil_params)
    @perfil.usuario = current_usuario

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to perfil_usuario_path, notice: 'Perfil criado com sucesso!' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfis/1
  # PATCH/PUT /perfis/1.json
  def update

    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to perfil_usuario_path, notice: 'Perfil atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_perfil
      @perfil = Perfil.where(usuario_id: current_usuario.id).first

      if @perfil.blank?
        @perfil = Perfil.new
      end 

    end


    def set_perfil_by_id
      @perfil = Perfil.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit( :usuario_id, :imagemPerfil, :descricao, :imagemCapa, :datacap, :datagcb, :corda ) # List here whitelisted params
    end

end
