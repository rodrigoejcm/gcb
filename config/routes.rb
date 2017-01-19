# == Route Map
#
#                         Prefix Verb   URI Pattern                                 Controller#Action
#                         bootsy        /bootsy                                     Bootsy::Engine
#                    publicacoes GET    /publicacoes(.:format)                      publicacoes#index
#                                POST   /publicacoes(.:format)                      publicacoes#create
#                 new_publicacao GET    /publicacoes/new(.:format)                  publicacoes#new
#                edit_publicacao GET    /publicacoes/:id/edit(.:format)             publicacoes#edit
#                     publicacao GET    /publicacoes/:id(.:format)                  publicacoes#show
#                                PATCH  /publicacoes/:id(.:format)                  publicacoes#update
#                                PUT    /publicacoes/:id(.:format)                  publicacoes#update
#                                DELETE /publicacoes/:id(.:format)                  publicacoes#destroy
#            new_usuario_session GET    /login(.:format)                            devise/sessions#new
#                usuario_session POST   /login(.:format)                            devise/sessions#create
#        destroy_usuario_session GET    /logout(.:format)                           devise/sessions#destroy
#               usuario_password POST   /password(.:format)                         devise/passwords#create
#           new_usuario_password GET    /password/new(.:format)                     devise/passwords#new
#          edit_usuario_password GET    /password/edit(.:format)                    devise/passwords#edit
#                                PATCH  /password(.:format)                         devise/passwords#update
#                                PUT    /password(.:format)                         devise/passwords#update
#    cancel_usuario_registration GET    /cancel(.:format)                           devise/registrations#cancel
#           usuario_registration POST   /                                           devise/registrations#create
#       new_usuario_registration GET    /cadastrar(.:format)                        devise/registrations#new
#      edit_usuario_registration GET    /configuracoes(.:format)                    devise/registrations#edit
#                                PATCH  /                                           devise/registrations#update
#                                PUT    /                                           devise/registrations#update
#                                DELETE /                                           devise/registrations#destroy
#           usuario_confirmation POST   /confirmation(.:format)                     devise/confirmations#create
#       new_usuario_confirmation GET    /confirmation/new(.:format)                 devise/confirmations#new
#                                GET    /confirmation(.:format)                     devise/confirmations#show
#                 lista_usuarios GET    /lista_usuarios(.:format)                   usuarios#lista_usuarios
#                 perfil_usuario GET    /perfil(.:format)                           perfis#show
#         perfil_publico_usuario GET    /perfil_professor/:id(.:format)             perfis#public_show
#               perfil_nova_foto GET    /perfil/incluir_foto(.:format)              perfis#incluir_foto
#            perfil_alterar_foto GET    /perfil/alterar_foto(.:format)              perfis#alterar_foto
#          perfil_nova_foto_capa GET    /perfil/incluir_foto_capa(.:format)         perfis#incluir_foto_capa
#       perfil_alterar_foto_capa GET    /perfil/alterar_foto_capa(.:format)         perfis#alterar_foto_capa
#          perfil_nova_descricao GET    /perfil/incluir_descricao(.:format)         perfis#incluir_descricao
#       perfil_alterar_descricao GET    /perfil/alterar_descricao(.:format)         perfis#alterar_descricao
#             perfil_novas_datas GET    /perfil/incluir_datas(.:format)             perfis#incluir_datas
#           perfil_alterar_datas GET    /perfil/alterar_datas(.:format)             perfis#alterar_datas
#              perfil_nova_corda GET    /perfil/incluir_corda(.:format)             perfis#incluir_corda
#           perfil_alterar_corda GET    /perfil/alterar_corda(.:format)             perfis#alterar_corda
#                         perfis POST   /perfis(.:format)                           perfis#create
#                         perfil PATCH  /perfis/:id(.:format)                       perfis#update
#                                PUT    /perfis/:id(.:format)                       perfis#update
#                        eventos GET    /eventos(.:format)                          eventos#index
#                                POST   /eventos(.:format)                          eventos#create
#                     new_evento GET    /eventos/new(.:format)                      eventos#new
#                    edit_evento GET    /eventos/:id/edit(.:format)                 eventos#edit
#                         evento GET    /eventos/:id(.:format)                      eventos#show
#                                PATCH  /eventos/:id(.:format)                      eventos#update
#                                PUT    /eventos/:id(.:format)                      eventos#update
#                                DELETE /eventos/:id(.:format)                      eventos#destroy
#      index_eventos_professores GET    /eventos-professores(.:format)              eventos#index_professores
#               proximos_eventos GET    /proximos-eventos(.:format)                 eventos#public_proximos_eventos
#                 publico_evento GET    /proximos-eventos/evento/:id(.:format)      eventos#public_evento
#  index_publicacoes_professores GET    /publicacoes-professores(.:format)          publicacoes#index_professores
#              todas_publicacoes GET    /todas-publicacoes(.:format)                publicacoes#public_publicacoes
#    todas_publicacoes_categoria GET    /todas-publicacoes/:nomeCategoria(.:format) publicacoes#public_publicacoes
#             publico_publicacao GET    /todas-publicacoes/publicacao/:id(.:format) publicacoes#public_publicacao
#                aprovar_usuario GET    /aprovacoes/aprovar-usuario/:id(.:format)   usuarios#aprovar_usuario
#               bloquear_usuario GET    /aprovacoes/bloquear-usuario/:id(.:format)  usuarios#bloquear_usuario
#                     aprovacoes GET    /aprovacoes(.:format)                       aprovacoes#aprovacoes
#                          sobre GET    /sobre(.:format)                            home#sobre
#                     admin_root GET    /admin(.:format)                            admin/dashboard#index
# batch_action_admin_publicacoes POST   /admin/publicacoes/batch_action(.:format)   admin/publicacoes#batch_action
#              admin_publicacoes GET    /admin/publicacoes(.:format)                admin/publicacoes#index
#                                POST   /admin/publicacoes(.:format)                admin/publicacoes#create
#           new_admin_publicacao GET    /admin/publicacoes/new(.:format)            admin/publicacoes#new
#          edit_admin_publicacao GET    /admin/publicacoes/:id/edit(.:format)       admin/publicacoes#edit
#               admin_publicacao GET    /admin/publicacoes/:id(.:format)            admin/publicacoes#show
#                                PATCH  /admin/publicacoes/:id(.:format)            admin/publicacoes#update
#                                PUT    /admin/publicacoes/:id(.:format)            admin/publicacoes#update
#                                DELETE /admin/publicacoes/:id(.:format)            admin/publicacoes#destroy
#    batch_action_admin_usuarios POST   /admin/usuarios/batch_action(.:format)      admin/usuarios#batch_action
#                 admin_usuarios GET    /admin/usuarios(.:format)                   admin/usuarios#index
#                                POST   /admin/usuarios(.:format)                   admin/usuarios#create
#              new_admin_usuario GET    /admin/usuarios/new(.:format)               admin/usuarios#new
#             edit_admin_usuario GET    /admin/usuarios/:id/edit(.:format)          admin/usuarios#edit
#                  admin_usuario GET    /admin/usuarios/:id(.:format)               admin/usuarios#show
#                                PATCH  /admin/usuarios/:id(.:format)               admin/usuarios#update
#                                PUT    /admin/usuarios/:id(.:format)               admin/usuarios#update
#                                DELETE /admin/usuarios/:id(.:format)               admin/usuarios#destroy
#     batch_action_admin_eventos POST   /admin/eventos/batch_action(.:format)       admin/eventos#batch_action
#                  admin_eventos GET    /admin/eventos(.:format)                    admin/eventos#index
#                                POST   /admin/eventos(.:format)                    admin/eventos#create
#               new_admin_evento GET    /admin/eventos/new(.:format)                admin/eventos#new
#              edit_admin_evento GET    /admin/eventos/:id/edit(.:format)           admin/eventos#edit
#                   admin_evento GET    /admin/eventos/:id(.:format)                admin/eventos#show
#                                PATCH  /admin/eventos/:id(.:format)                admin/eventos#update
#                                PUT    /admin/eventos/:id(.:format)                admin/eventos#update
#                                DELETE /admin/eventos/:id(.:format)                admin/eventos#destroy
#                admin_dashboard GET    /admin/dashboard(.:format)                  admin/dashboard#index
#  batch_action_admin_categorias POST   /admin/categorias/batch_action(.:format)    admin/categorias#batch_action
#               admin_categorias GET    /admin/categorias(.:format)                 admin/categorias#index
#                                POST   /admin/categorias(.:format)                 admin/categorias#create
#            new_admin_categoria GET    /admin/categorias/new(.:format)             admin/categorias#new
#           edit_admin_categoria GET    /admin/categorias/:id/edit(.:format)        admin/categorias#edit
#                admin_categoria GET    /admin/categorias/:id(.:format)             admin/categorias#show
#                                PATCH  /admin/categorias/:id(.:format)             admin/categorias#update
#                                PUT    /admin/categorias/:id(.:format)             admin/categorias#update
#                                DELETE /admin/categorias/:id(.:format)             admin/categorias#destroy
#                 admin_comments GET    /admin/comments(.:format)                   admin/comments#index
#                                POST   /admin/comments(.:format)                   admin/comments#create
#                  admin_comment GET    /admin/comments/:id(.:format)               admin/comments#show
#                                DELETE /admin/comments/:id(.:format)               admin/comments#destroy
#                           root GET    /                                           home#index
#
# Routes for Bootsy::Engine:
# image_gallery_images GET    /image_galleries/:image_gallery_id/images(.:format)     bootsy/images#index
#                      POST   /image_galleries/:image_gallery_id/images(.:format)     bootsy/images#create
#  image_gallery_image DELETE /image_galleries/:image_gallery_id/images/:id(.:format) bootsy/images#destroy
#               images GET    /images(.:format)                                       bootsy/images#index
#                      POST   /images(.:format)                                       bootsy/images#create
#                image DELETE /images/:id(.:format)                                   bootsy/images#destroy
#

Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  

  #resources :publicacaos
  resources :publicacoes

  #devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'cadastro', edit: 'configuracoes' }
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

  #--GEOGRAFIA----------------------------

  get '/geografia/:pais', to: 'geografia#estadosprovincias', as: 'geografia_estadosprovincias'
  get '/geografia/:pais/:estado', to: 'geografia#cidades', as: 'geografia_cidades'
  
  #get '/geografia/cidades/:pais:estado', to: 'geografia#cidade', as: 'geografia_cidades'


  #END GEOGRAFIA

  #--EVENTOS----------------------------
  
  resources :eventos

  get '/eventos-professores', to: 'eventos#index_professores', as: 'index_eventos_professores'
  get '/proximos-eventos', to: 'eventos#public_proximos_eventos', as: 'proximos-eventos'
  get '/proximos-eventos/evento/:id', to: 'eventos#public_evento', as: 'publico-evento'

  #filtro de eventos
  get '/proximos-eventos/local/:p',         to: 'eventos#public_proximos_eventos_local',           as: 'publico-evento-local'
  get '/proximos-eventos/local/',           to: 'eventos#public_proximos_eventos_sem_local',       as: 'publico-evento-sem-local'
  get '/proximos-eventos/data/:a/:m',       to: 'eventos#public_proximos_eventos_data',            as: 'publico-evento-data'
  get '/proximos-eventos/usuario/:idusuario',      to: 'eventos#public_proximos_eventos_usuario',   as: 'publico-evento-usuario'


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


  
  resources :turmas
  resources :locais
  get '/encontre-a-capoeira', to: 'geolocalizacoes#index', as: 'geolocalizacoes'



  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  

end
