# == Schema Information
#
# Table name: categorias
#
#  id            :integer          not null, primary key
#  nomeCategoria :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Categoria < ApplicationRecord

	has_many :publicacoes
end
