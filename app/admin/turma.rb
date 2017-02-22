ActiveAdmin.register Turma do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

 # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :id, :nome, :periodo, :usuario, :local, :local_nome, :usuario_id
 
    index do
        column :id
        column :local do |t|
            t.local.nome
        end
        column :created_at
        column :usuario do |u|
            u.usuario.apelido
        end
        column :periodo
        actions
    end
 
    #filter :usuario , :as => :select, :collection => Usuario.all.map{|u| [u.apelido,u.id]}
 
    form do |f|
        f.inputs "" do
            f.input :local, :as => :select, :collection => Hash[Local.all.map{|c| [c.nome,c.id]}]
            f.input :usuario,  :as => :select, :collection => Hash[Usuario.all.map{|b| [b.apelido,b.id]}]
            f.input :periodo
        end
        f.actions
    end


end
