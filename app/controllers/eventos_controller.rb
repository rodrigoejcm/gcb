class EventosController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :public_proximos_eventos
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, :except => [:show, :public_proximos_eventos]

  


  def public_proximos_eventos
    @eventos = Evento.where(aprovado: true).paginate(:page => params[:page], :per_page => 5)
  end


  # GET /eventos
  # GET /eventos.json
  def index
    #mostra os eventos em que o usuario tem permissao para dar update 
   @eventos = Evento.accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    if podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['pode']
      @evento = Evento.new
    else
      redirect_to eventos_path, alert: podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['justificativa'] 
    end
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    if podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['pode']
      @evento = Evento.new(evento_params)
      @evento.aprovado = false
      @evento.usuario = current_usuario


      respond_to do |format|
        if @evento.save
          format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
          format.json { render :show, status: :created, location: @evento }
        else
          format.html { render :new }
          format.json { render json: @evento.errors, status: :unprocessable_entity }
        end
      end
    
    else
      redirect_to eventos_path, alert: podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['justificativa'] 
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    if podeCadastrarNovoEventoOuExcluirOuEditar['editar']['pode']
      respond_to do |format|
        if @evento.update(evento_params)
          format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
          format.json { render :show, status: :ok, location: @evento }
        else
          format.html { render :edit }
          format.json { render json: @evento.errors, status: :unprocessable_entity }
        end
      end
    else
       redirect_to eventos_path, alert: podeCadastrarNovoEventoOuExcluirOuEditar['editar']['justificativa'] 
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    if podeCadastrarNovoEventoOuExcluirOuEditar['excluir']['pode']
      @evento.destroy
      respond_to do |format|
        format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to eventos_path, alert: podeCadastrarNovoEventoOuExcluirOuEditar['excluir']['justificativa'] 
    end
  end

  # Limitaçoes de usuarios normais (professor)
  def podeCadastrarNovoEventoOuExcluirOuEditar
      if current_usuario.usuarioLimitado? #usuario é limitado?

        resumo_usuario = "Você possui uma conta grátis. Somente usuarios Premium podem cadastrar mais de um evento"

        if current_usuario.eventos.exists? #usuario possui evento?
            ultimoEvento =  current_usuario.eventos.last
            if Date.today > ultimoEvento.data_hora_inicio #evento ja aconteceu? 
              if Date.today.year > ultimoEvento.data_hora_inicio.year
                  cadastrar = true #novo ano - pode cadastrar novo evento
                  cadastrar_justificativa = "Último evento cadastrado ocorreu no ano passado. Pode cadastrar novo evento."
                  excluir = false 
                  excluir_justificativa = "Evento já aconteceu. Não é possivel excluir esse evento."
                  editar = false 
                  editar_justificativa = "Evento já aconteceu. Não é possivel excluir esse evento."
                  
              else  
                  cadastrar = false # ja possui um evento no ano. nao pode cadastrar novo
                  cadastrar_justificativa = "Você já possui um evento cadastrado para o ano de " + Date.today.year.to_s + ". Não é possivel cadastrar novos eventos."
                  excluir = false #evento ja aconteceu - nao pode excluir
                  excluir_justificativa = "Evento já aconteceu. Não é possivel excluir esse evento."
                  editar = false #evento ja aconteceu - nao pode editar
                  editar_justificativa = "Evento já aconteceu. Não é possivel excluir esse evento."
              end
            else
              excluir = true #evento ainda nao aconteceu - pode excluir
              excluir_justificativa = "Evento ainda não aconteceu."
              editar = true #evento ainda nao aconteceu - pode editar
              editar_justificativa = "Evento ainda não aconteceu."
              cadastrar = false #usuario ja possui evento - precisa exclur o evento atual antes
              cadastrar_justificativa = "Você já possui um evento cadastrado que ainda nao aconteceu. É necessário excluir esse evento para cadastra um novo."
            end
        else 
          cadastrar = true
          cadastrar_justificativa = "Você nao possui nenhum evento cadastrado."
          excluir = false
          excluir_justificativa = "Não existe evento para ser excluir."
          editar = false
          editar_justificativa = "Não existe evento para ser editado."

        end
      else
        cadastrar = true
        cadastrar_justificativa = "Usuários Premium pode cadastrar eventos ilimitados."
        excluir = true
        excluir_justificativa = "Usuários Premium possuem total controle sobre os eventos cadastrado."
        editar = true
        editar_justificativa = "Usuários Premium possuem total controle sobre os eventos cadastrado."
        resumo_usuario = ""  
      end
      return {  "excluir" => { "pode" => excluir, "justificativa" => excluir_justificativa }, 
                    "cadastrar" => { "pode" => cadastrar, "justificativa" => cadastrar_justificativa },
                    "editar" => { "pode" => editar, "justificativa" => editar_justificativa },
                    "resumo_usuario_eventos" => resumo_usuario }
  end
  # -- para mostrar o resultado na view -- helper_method :podeCadastrarNovoEvento?
  helper_method :podeCadastrarNovoEventoOuExcluirOuEditar
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit( :titulo, :descricao, :local, :data_hora_inicio, :data_hora_fim, :aprovado, :usuario, :image) # List here whitelisted params

    end
end

