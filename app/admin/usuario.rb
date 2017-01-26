ActiveAdmin.register Usuario do

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
  permit_params :email, :password, :password_confirmation, :role, :approved
 
    index do
        column :nome do |n|
            n.apelido
        end
        column :email
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :role
        column :approved
        actions
    end
 
    filter :email
 
    form do |f|
        f.inputs "User Details" do
            f.input :email
            f.input :role, as: :radio, collection: {None: "none", Administrator: "admin", Mestre: "mestre", Professor: "professor", Colaborador_teste: "colaborador_teste" }
            f.input :approved, as: :radio, collection: {Aprovado: true, Nao_Aprovado: false }
        end
        f.actions
    end


end
