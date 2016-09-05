Rails.application.routes.draw do
  

  #devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'cadastrar', edit: 'configuracoes' }
  
  resources :eventos
  


  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  

end
