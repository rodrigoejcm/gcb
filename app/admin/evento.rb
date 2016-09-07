ActiveAdmin.register Evento do
    config.per_page = 20


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

  permit_params :titulo, :descricao, :local, :usuario_id, :aprovado, :data_hora_inicio, :data_hora_fim
 
    index do
        column :titulo
        column :descricao do |evt|
            evt.descricao.truncate(100)    
        end
        column :local
        column :usuario
        column :aprovado
        column :image do |evt|
            url = evt.image_url
            image_tag(url, size: '80')
        end
        actions
    end
 
    filter :titulo
 
    form do |f|
        f.inputs "Eventos" do
            f.input :titulo
            f.input :descricao
            f.input :local
            f.input :aprovado, as: :radio, collection: {Aprovado: "APROVADO", Reprovado: "REPROVADO", Indefinido: "INDEFINIDO" }
            f.input :data_hora_inicio, as: :datetime_picker
            f.input :data_hora_fim, as: :datetime_picker
            f.input :image,  :as => :file ,:hint => image_tag(f.object.image_url, size: '100')
            
            #f.input :usuario
            f.input :usuario,  :as => :select, :collection => Hash[Usuario.all.map{|b| [b.nome,b.id]}]
        end
        f.actions
    end


end
