class GeolocalizacoesController < ApplicationController

	before_action :set_locais_e_turmas_ativas, only: [:index, :inicializaFiltros, :index_filtro]
	before_action :set_local_e_turmas_ativas, only: [:index_local]
	before_action :set_turma_ativa, only: [:index_local_turma]
	before_action :inicializaFiltros, only: [:index, :index_local, :index_local_turma, :index_filtro]
    
	def index
		#@locaisDaCapoeira = Local.includes(:turmas).where.not( turmas: {id: nil}).order("turmas.hora_inicio asc")
		
		## DUVIDA ##
		# Esta e a maneira correta de fazer filtros?
		# Criando uma rota, filtrando os registros atraves da funcao e aproveitando a view?

		if params[:tipo] == 'p'
			#parâmetro Professor
			@locaisDaCapoeira = @locaisDaCapoeira.where( turmas: {usuario_id: params[:parametro]})
			@nomeFiltro  = Usuario.find(params[:parametro]).apelidoCompleto;


		elsif params[:tipo] == 'l' 
			#parâmetro local
			@locaisDaCapoeira = @locaisDaCapoeira.where( pais: params[:parametro])

		end


	end

	def index_local
		
	end

	def index_local_turma
		
	end

	def inicializaFiltros
      
      professores= Array.new 
      locais = Array.new 
      
      paises_temp = CS.countries
      paises_temp.delete("BR")
      paises_temp[:BR] = "Brasil"
      
      for local in @locaisDaCapoeira

        localidade = [paises_temp[local.pais.to_sym], local.pais]

        for turma in local.turmas
        	professor = [ turma.usuario.apelidoCompleto, turma.usuario ]
        	professores.push(professor)
        end
          
       	locais.push(localidade)

       end


    
      @resultProfs = professores.inject(Hash.new(0)) { |hash,element|
        hash[element] +=1
        hash
      }

      resultLocais_temp = locais.inject(Hash.new(0)) { |hash,element|
        hash[element] +=1
        hash
      }

      @resultLocais = resultLocais_temp.sort
        

    end



    private
    # Use callbacks to share common setup or constraints between actions.

    def set_locais_e_turmas_ativas
      @locaisDaCapoeira = 	Local.includes(:turmas)
      						.where.not( turmas: {id: nil})
      						.where( turmas: {turma_ativa: true})
      						.order("turmas.hora_inicio asc")
      	#("user_extensions.company desc")
		#City.includes(:photos).where.not( photos: {city_id: nil} )
		#City.includes(:photos).where(photos: { city_id: nil })
		#City.left_outer_joins(:photos).where(photos: {id: nil})
    end

    def set_local_e_turmas_ativas
    	if params[:id_local]
     		@local =  	Local.includes(:turmas)
     					.where.not( turmas: {id: nil})
     					.where( turmas: {turma_ativa: true})
     					.where(local_id: params[:id_local])
     					.order("turmas.hora_inicio asc")
      	end
    end

    def set_turma_ativa
    	if (params[:id_local] && [:id_turma])
     		@turma =  	Turma.where(local_id: params[:id_local])
     					.where(turma_id: params[:id_turma])
     					.where(turma_ativa: true)
     					
      	end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geo_params
      #params.require(:evento).permit( :titulo, :descricao, :local, 
         	                          #:data_hora_inicio, :data_hora_inicio_time,:data_hora_inicio_date,
                                      #:data_hora_fim, :data_hora_fim_time, :data_hora_fim_date, 
                                      #:aprovado, :usuario, :image, :image_cache, :bootsy_image_gallery_id,
                                      #:cidade, :pais, :estadoprovincia, :p, :ep, :c, :idusuario) # List here whitelisted params

    end


end
