class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]
  before_action :set_listas, only: [:new, :new_turma_sem_local, :edit, :create]

  # GET /turmas
  # GET /turmas.json
  def index
    #@turmas = Turma.includes(:local).where(usuario: current_usuario).accessible_by(current_ability, :update).order("locais.nome asc").paginate(:page => params[:page], :per_page => 10)


    @turmas =
              Local.includes(:turmas)
              .where( turmas: {usuario: current_usuario})
              .where( turmas: {turma_ativa: true})
              .order( nome: :asc)
              .paginate(:page => params[:page], :per_page => 3)

      puts @turmas.size

  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
  end

  # GET /turmas/new
  def new

    if podeCadastrarNovaTurma
      @turma = Turma.new
    else
      redirect_to turmas_path, notice: 'Você já possui uma turma cadastrada. Para cadastrar novas turmas, é necessário ser um usuário Colaborador. '
    end

  end

  def new_turma_sem_local
    @turma = Turma.new
    @turma.local = Local.find(params[:id_local])
    render :new
  end

  # GET /turmas/1/edit
  def edit


  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = Turma.new(turma_params)
    @turma.usuario = current_usuario
    @turma.turma_ativa = true

    respond_to do |format|
      if @turma.save
        format.html { redirect_to turmas_path, notice: 'Turma salva com sucesso.' }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to turmas_path, notice: 'Turma atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @turma }
      else
        format.html { render :edit }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Turma excluída com sucesso.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.

    def podeCadastrarNovaTurma

        if (current_usuario.usuarioLimitado? && current_usuario.turmas.exists?)
            #se usuario é limitado e ja possui local
            #true -true
            return false
        end

        return true

    end

    def set_turma
      @turma = Turma.find(params[:id])
    end

    # listas de locais , periodos, publico e etc.
    def set_listas
      #@locais = Local.all.map{|l| [l.nome,l.id]}
      @locais = Local.all
      @periodos = ['Manhã','Tarde','Noite']
      @publicos = ['Infantil','Adulto']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turma_params

      params.require(:turma).permit(
                                      :local_id,
                                      :local_nome,
                                      :local,
                                      :hora_inicio,
                                      :hora_fim,
                                      :periodo,
                                      :publico,
                                      :observacoes,
                                      :dia_seg,
                                      :dia_ter,
                                      :dia_qua,
                                      :dia_qui,
                                      :dia_sex,
                                      :dia_sab,
                                      :dia_dom,
                                      :turma_ativa)
    end
end
