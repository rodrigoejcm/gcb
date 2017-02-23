class LocaisController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]
  before_action :defineLocalizacaoNova, only: [:new, :create, :edit]


  # GET /locais
  # GET /locais.json
  def index
    @locais = Local.where(usuario: current_usuario).accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /locais/1
  # GET /locais/1.json
  def show
  end

  # GET /locais/new
  def new
    @local = Local.new
  end

  # GET /locais/1/edit
  def edit
  end

  # POST /locais
  # POST /locais.json
  def create
    @local = Local.new(local_params)
    @local.usuario = current_usuario

    respond_to do |format|
      if @local.save
        format.html { redirect_to new_turma_sem_local_path @local, notice: 'Novo local cadastrado com sucesso. Verifique se já está aparecendo na lista' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locais/1
  # PATCH/PUT /locais/1.json
  def update
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to turmas_path, notice: 'Local atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locais/1
  # DELETE /locais/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Local excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def defineLocalizacaoNova
      @paises_temp= CS.countries
      @paises_temp.delete("BR")
      @paises_temp[:BR] = "Brasil"
      @paises = @paises_temp.sort.map {|k,v| [v,k]}

      @estados =  Hash.new
      @cidades =  Hash.new
  end

  def defineLocalizacaoExistente(pais,estadoprovincia)
      @paises_temp = CS.countries
      @paises_temp.delete("BR")
      @paises_temp[:BR] = "Brasil"
      @paises = @paises_temp.sort.map {|k,v| [v,k]}
      @estados_temp =  CS.states(pais).sort.map {|k,v| [v,k]}
      @estados = @estados_temp
      @cidades =  CS.cities(estadoprovincia,pais)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit( :nome, :descricao, :endereco,
                                      :usuario, :imagem, :cidade, :pais, :estadoprovincia, :contato1, :contato2, :latitude, :longitude) # List here whitel
    end
end
