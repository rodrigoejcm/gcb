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
      @publicacoes = Publicacao.where(aprovado: "APROVADO", categoria: @categoria).order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
    
    else
    
      @publicacoes = Publicacao.where(aprovado: "APROVADO").order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
    
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
    @publicacoes = Publicacao.where(usuario: current_usuario).accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 5)
  end


    def index_professores
    #setado pelo before action
    @publicacoes = Publicacao.accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 10)
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

    if @publicacao.categoria.nil?
      #refatorar para ser a default atraves da base de dades
      @publicacao.categoria =  Categoria.find_by nomeCategoria: "Geral"
    end 
    

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
      
      format.html { redirect_back(fallback_location: (request.referer || root_path), notice: 'Publicação excluĩda com sucesso.' ) }
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
      params.require(:publicacao).permit( :titulo, :texto_publicacao, :usuario,
                                          :image, :categoria_id, :aprovado, 
                                          :nomeCategoria, :bootsy_image_gallery_id) # List here whitelisted params
    end
end
