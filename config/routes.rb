Rails.application.routes.draw do
  

  #resources :publicacaos
  resources :publicacoes
  #devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'cadastrar', edit: 'configuracoes' }
  
  resources :eventos

  get '/proximos-eventos', to: 'eventos#public_proximos_eventos', as: 'proximos-eventos'
  #get '/proximos-eventos/:id', to: 'eventos#public_evento'

  get '/todas-publicacoes', to: 'publicacoes#public_publicacoes', as: 'todas-publicacoes'
  #get '/proximos-eventos/:id', to: 'eventos#public_evento'

  get '/aprovacoes/aprovar-usuario/:id', to: 'usuarios#aprovar_usuario', as: 'aprovar-usuario'
  get '/aprovacoes/bloquear-usuario/:id', to: 'usuarios#bloquear_usuario', as: 'bloquear-usuario'


  get '/aprovacoes', to: 'aprovacoes#aprovacoes', as: 'aprovacoes'


  



  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  

end
