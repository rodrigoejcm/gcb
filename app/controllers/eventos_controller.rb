class EventosController < ApplicationController
  load_and_authorize_resource
  
  #CANCANCAN#
  skip_authorize_resource :only => [  :public_proximos_eventos,
                                      :public_proximos_eventos_local,
                                      :public_proximos_eventos_sem_local,
                                      :public_proximos_eventos_data,
                                      :public_proximos_eventos_usuario ]
  
  before_action :defineLocalizacaoNova, only: [:new, :create]
  before_action :set_evento, only: [:show, :edit, :update, :destroy, :public_evento]
  
  #DEVISE#
  before_action :authenticate_usuario!, :except => [  :show, 
                                                      :public_proximos_eventos, 
                                                      :public_evento,
                                                      :public_proximos_eventos_local,
                                                      :public_proximos_eventos_sem_local,
                                                      :public_proximos_eventos_data,
                                                      :public_proximos_eventos_usuario
                                                    ]
  before_action :inicializaFiltros, only: [
                                            :public_proximos_eventos_local,
                                            :public_proximos_eventos,
                                            :public_proximos_eventos_sem_local, 
                                            :public_proximos_eventos_data, 
                                            :public_evento,
                                            :public_proximos_eventos_usuario
                                          ]

  
  def public_proximos_eventos
    @eventos = Evento.where(aprovado: "APROVADO").where('data_hora_inicio > ?', DateTime.now).order(data_hora_inicio: :asc).paginate(:page => params[:page], :per_page => 5)
  end


  #---filtros

  def public_proximos_eventos_local
    if params[:p]
      @texto_filtro = params[:p]
      @eventos =  Evento.where(aprovado: "APROVADO")
                        .where('data_hora_inicio > ?', DateTime.now)
                        .where(pais: params[:p])
                        .order(data_hora_inicio: :asc)
                        .paginate(:page => params[:page], :per_page => 5)
     
      render 'public_proximos_eventos'
    else
      redirect_to proximos_eventos_path
    end
  end

  def public_proximos_eventos_sem_local
    #rREFATORAR - PODE SER USADO NO METODO ANTERIOR NO ELSE
    @texto_filtro = "Outros Locais"
    @eventos =  Evento.where(aprovado: "APROVADO")
                      .where('data_hora_inicio > ?', DateTime.now)
                      .where(
                              "(pais is NULL or pais = '') or " + 
                              "(estadoprovincia is NULL or estadoprovincia = '') or " +
                              "(cidade is NULL or cidade = '')"
                            )
                      .order(data_hora_inicio: :asc)
                      .paginate(:page => params[:page], :per_page => 5)
    render 'public_proximos_eventos'
  end

  def public_proximos_eventos_data
    @texto_filtro = params[:m]+"/"+params[:a]
    @eventos =  Evento.where(aprovado: "APROVADO")
                      .where('data_hora_inicio > ?', DateTime.now)
                      .where('extract(year  from data_hora_inicio) = ?', params[:a])
                      .where('extract(month  from data_hora_inicio) = ?', params[:m])
                      .order(data_hora_inicio: :asc)
                      .paginate(:page => params[:page], :per_page => 5)
    render 'public_proximos_eventos'
  end

  def public_proximos_eventos_usuario
    @texto_filtro = (Usuario.find_by id: params[:idusuario]).apelidoCompleto
    @eventos =  Evento.where(aprovado: "APROVADO")
                      .where('data_hora_inicio > ?', DateTime.now)
                      .where(usuario: params[:idusuario])
                      .order(data_hora_inicio: :asc)
                      .paginate(:page => params[:page], :per_page => 5)
    render 'public_proximos_eventos'
  end

  #---FIM 


  def public_evento
    #setado pelo before action
  end

  def index
    #mostra os eventos em que o usuario tem permissao para dar update 
    @eventos = Evento.where(usuario: current_usuario).accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 5)
  end

  def index_professores
    #setado pelo before action
    @eventos = Evento.accessible_by(current_ability, :update).paginate(:page => params[:page], :per_page => 10)
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
      redirect_to eventos_path, notice: podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['justificativa'].to_s 
    end
  end

  # GET /eventos/1/edit
  def edit
    defineLocalizacaoExistente(@evento.pais,@evento.estadoprovincia )
  end

  # POST /eventos
  # POST /eventos.json
  def create
    if podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['pode']
      @evento = Evento.new(evento_params)
      @evento.usuario = current_usuario


      respond_to do |format|
        if @evento.save
          format.html { redirect_to @evento, notice: 'Evento criado com sucesso.' }
          format.json { render :show, status: :created, location: @evento }
        else
          format.html { render :new }
          format.json { render json: @evento.errors, status: :unprocessable_entity }
        end
      end
    
    else
      redirect_to eventos_path, notice: podeCadastrarNovoEventoOuExcluirOuEditar['cadastrar']['justificativa'].to_s
    end
  end

  def update
    if podeCadastrarNovoEventoOuExcluirOuEditar['editar']['pode']
      respond_to do |format|

        if !current_usuario.admin? && !current_usuario.mestre?
          @evento.aprovado = 'INDEFINIDO'          
        end

        if @evento.update(evento_params)
          format.html { redirect_to @evento, notice: 'Evento alterado com sucesso.' }
          format.json { render :show, status: :ok, location: @evento }
        else
          format.html { render :edit }
          format.json { render json: @evento.errors, status: :unprocessable_entity }
        end
      end
    else
       redirect_to eventos_path, notice: podeCadastrarNovoEventoOuExcluirOuEditar['editar']['justificativa'].to_s 
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    if podeCadastrarNovoEventoOuExcluirOuEditar['excluir']['pode']
      @evento.destroy
      respond_to do |format|
        format.html { redirect_back(fallback_location: (request.referer || root_path), notice: 'Evento excluído com sucesso.' ) }
        format.json { head :no_content }
      end
    else
      redirect_to eventos_path, notice: podeCadastrarNovoEventoOuExcluirOuEditar['excluir']['justificativa'] 
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

  def inicializaFiltros
      
      @eventos = Evento.where(aprovado: "APROVADO").where('data_hora_inicio > ?', DateTime.now).order(data_hora_inicio: :asc).paginate(:page => params[:page], :per_page => 5)
      @datas = Array.new 
      @professores= Array.new 
      @locais = Array.new 
      @paises_temp = CS.countries
      @paises_temp.delete("BR")
      @paises_temp[:BR] = "Brasil"
      
      for evento in @eventos

        data = [(l evento.data_hora_inicio, format: :mes_ano),evento.data_hora_inicio.year,evento.data_hora_inicio.month ]
        professor = [ evento.usuario.apelidoCompleto, evento.usuario ]
        
        if (evento.pais.blank?)
        #if (evento.cidade.blank? || evento.estadoprovincia.blank? || evento.pais.blank?)
          local = ['Outros']
        else
          #refatorado pra mostrar apenas país
          local = [@paises_temp[evento.pais.to_sym], evento.pais, evento.estadoprovincia, evento.cidade]
        end

        @datas.push(data)
        @professores.push(professor)
        @locais.push(local)

      end




      @resultDatas = @datas.inject(Hash.new(0)) { |hash,element|
        hash[element] +=1
        hash
      }

      @resultProfs = @professores.inject(Hash.new(0)) { |hash,element|
        hash[element] +=1
        hash
      }

      @resultLocais_temp = @locais.inject(Hash.new(0)) { |hash,element|
        hash[element] +=1
        hash
      }

      @resultLocais = @resultLocais_temp.sort


  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit( :titulo, :descricao, :local, 
                                      :data_hora_inicio, :data_hora_inicio_time,:data_hora_inicio_date,
                                      :data_hora_fim, :data_hora_fim_time, :data_hora_fim_date, 
                                      :aprovado, :usuario, :image, :image_cache, :bootsy_image_gallery_id,
                                      :cidade, :pais, :estadoprovincia, :p, :ep, :c, :idusuario) # List here whitelisted params

    end
end

