Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  

  #resources :publicacaos
  resources :publicacoes
  #devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'cadastrar', edit: 'configuracoes' }
  get 'lista_usuarios' , to: 'usuarios#lista_usuarios', as: 'lista_usuarios'



  #PERFIL
  
  get '/perfil', to: 'perfis#show', as: 'perfil_usuario'
  get '/perfil_professor/:id', to: 'perfis#public_show', as: 'perfil_publico_usuario'
  # PERFIL - FOTO PERFIL
  get '/perfil/incluir_foto' , to: 'perfis#incluir_foto' , as: 'perfil_nova_foto'
  get '/perfil/alterar_foto' , to: 'perfis#alterar_foto' , as: 'perfil_alterar_foto'
  # PERFIL - FOTO CAPA
  get '/perfil/incluir_foto_capa' , to: 'perfis#incluir_foto_capa' , as: 'perfil_nova_foto_capa'
  get '/perfil/alterar_foto_capa' , to: 'perfis#alterar_foto_capa' , as: 'perfil_alterar_foto_capa'
  # PERFIL - DESCRICAO
  get '/perfil/incluir_descricao' , to: 'perfis#incluir_descricao' , as: 'perfil_nova_descricao' 
  get '/perfil/alterar_descricao' , to: 'perfis#alterar_descricao' , as: 'perfil_alterar_descricao'
  # PERFIL - DATAS
  get '/perfil/incluir_datas' , to: 'perfis#incluir_datas' , as: 'perfil_novas_datas' 
  get '/perfil/alterar_datas' , to: 'perfis#alterar_datas' , as: 'perfil_alterar_datas'
  # PERFIL - CORDA
  get '/perfil/incluir_corda' , to: 'perfis#incluir_corda' , as: 'perfil_nova_corda' 
  get '/perfil/alterar_corda' , to: 'perfis#alterar_corda' , as: 'perfil_alterar_corda' 

  #put '/editar_perfil/:id', to: 'perfis#update', as: 'update_perfil'
  resources :perfis, only: [:update, :create]

  #END PERFIL



  #--EVENTOS----------------------------
  
  resources :eventos

  get '/eventos-professores', to: 'eventos#index_professores', as: 'index_eventos_professores'
  get '/proximos-eventos', to: 'eventos#public_proximos_eventos', as: 'proximos-eventos'
  get '/proximos-eventos/evento/:id', to: 'eventos#public_evento', as: 'publico-evento'
  #get '/proximos-eventos/:id', to: 'eventos#public_evento'

  #END EVENTOS


  get '/publicacoes-professores', to: 'publicacoes#index_professores', as: 'index_publicacoes_professores'
  get '/todas-publicacoes', to: 'publicacoes#public_publicacoes', as: 'todas-publicacoes'
  get '/todas-publicacoes/:nomeCategoria', to: 'publicacoes#public_publicacoes', as: 'todas-publicacoes-categoria'
  get '/todas-publicacoes/publicacao/:id', to: 'publicacoes#public_publicacao', as: 'publico-publicacao'
  #get '/proximos-eventos/:id', to: 'eventos#public_evento'

  get '/aprovacoes/aprovar-usuario/:id', to: 'usuarios#aprovar_usuario', as: 'aprovar-usuario'
  get '/aprovacoes/bloquear-usuario/:id', to: 'usuarios#bloquear_usuario', as: 'bloquear-usuario'
  get '/aprovacoes', to: 'aprovacoes#aprovacoes', as: 'aprovacoes'

  get '/sobre', to: 'home#sobre', as: 'sobre'


  



  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  

end
