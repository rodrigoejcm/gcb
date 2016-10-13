class PublicacoesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :public_publicacoes
  before_action :set_publicacao, only: [:show, :edit, :update, :destroy, :public_publicacao]
  before_action :set_categorias, only: [:public_publicacao, :public_publicacoes]
  before_action :authenticate_usuario!, :except => [:show, :public_publicacoes, :public_publicacao]

  
  #Exibicao das publicacoes aprovadas - todos os usuarios possuem acesso
  def public_publicacoes

    # @categorias set pelo before action

    if params[:nomeCategoria]
    
      @categoria = Categoria.where(nomeCategoria: params[:nomeCategoria])
      @publicacoes = Publicacao.where(aprovado: "APROVADO", categoria: @categoria).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    
    else
    
      @publicacoes = Publicacao.where(aprovado: "APROVADO").order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    
    end

  end

  
  def public_publicacao
    # @publicacao set pelo before action
    # @categorias set pelo before action
  end


  # GET /publicacaos
  # GET /publicacaos.json
  def index
    #mostra as publicacoes que o usuario tem acesso para dar ubdate
    @publicacoes = Publicacao.accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /publicacaos/1
  # GET /publicacaos/1.json
  def show
  end

  # GET /publicacaos/new
  def new
    @publicacao = Publicacao.new
    @Categorias = Categoria.all
  end

  # GET /publicacaos/1/edit
  def edit
  end



  # POST /publicacaos
  # POST /publicacaos.json
  def create
    @publicacao = Publicacao.new(publicacao_params)
    @publicacao.usuario = current_usuario
    

    respond_to do |format|
      if @publicacao.save
        format.html { redirect_to @publicacao, notice: 'Publicação criada com sucesso.' }
        format.json { render :show, status: :created, location: @publicacao }
      else
        format.html { render :new }
        format.json { render json: @publicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicacaos/1
  # PATCH/PUT /publicacaos/1.json
  def update
    respond_to do |format|
      if @publicacao.update(publicacao_params)
        format.html { redirect_to @publicacao, notice: 'Publicação alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @publicacao }
      else
        format.html { render :edit }
        format.json { render json: @publicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicacaos/1
  # DELETE /publicacaos/1.json
  def destroy
    @publicacao.destroy
    respond_to do |format|
      format.html { redirect_to publicacoes_url, notice: 'Publicação excluĩda com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacao
      @publicacao = Publicacao.find(params[:id])
    end

    def set_categorias
      @categorias = Publicacao.where(aprovado: "APROVADO").group(:categoria).count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacao_params
      params.fetch(:publicacao, {})
      params.require(:publicacao).permit( :titulo, :texto_publicacao, :usuario, :image, :categoria_id, :aprovado, :nomeCategoria) # List here whitelisted params
    end
end
