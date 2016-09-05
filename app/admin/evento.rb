ActiveAdmin.register Evento do

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

  permit_params :titulo, :descricao, :local, :usuario, :aprovado
 
    index do
        column :titulo
        column :descricao
        column :local
        column :usuario
        column :aprovado
        actions
    end
 
    filter :titulo
 
    form do |f|
        f.inputs "User Details" do
            f.input :titulo
            f.input :descricao
            f.input :local
            f.input :aprovado, as: :radio, collection: {Sim: "true", Nao: "false"}
        end
        f.actions
    end


end
