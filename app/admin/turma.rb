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
  permit_params :id, :nome, :pais, :usuario, :endereco
 
    index do
        column :id
        column :local
        column :created_at
        column :usuario
        column :periodo
        actions
    end
 
    filter :local
 
    form do |f|
        f.inputs "" do
            f.input :local
            f.input :usuario
            f.input :periodo
        end
        f.actions
    end


end
