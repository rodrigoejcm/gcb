ActiveAdmin.register Publicacao do
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
 permit_params :titulo, :texto_publicacao, :usuario_id, :aprovado, :image, :categoria_id
 
    index do
        column :titulo
        column :texto_publicacao
        column :usuario do |pub|
        	pub.usuario.nome
        end
        column :aprovado
        column :categoria do |pub|
        	pub.categoria.nomeCategoria
        end
        column :image do |pub|
        	url = pub.image_url
        	image_tag(url, size: '80')
        end
        actions
    end
 
    filter :titulo
 
    form do |f|
        f.inputs "Publicacoes" do
            f.input :titulo
            f.input :texto_publicacao
            f.input :aprovado, as: :radio, collection: {Sim: "true", Nao: "false"}
            f.input :image,  :as => :file ,:hint => image_tag(f.object.image_url, size: '100')
            #f.input :usuario
            f.input :usuario,  :as => :select, :collection => Hash[Usuario.all.map{|b| [b.nome,b.id]}]
        	f.input :categoria, :as => :select, :collection => Hash[Categoria.all.map{|b| [b.nomeCategoria,b.id]}]
        end
        f.actions
    end


end
