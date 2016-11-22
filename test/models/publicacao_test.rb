# == Schema Information
#
# Table name: publicacoes
#
#  id               :integer          not null, primary key
#  titulo           :string
#  texto_publicacao :text
#  usuario_id       :integer
#  image            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  aprovado         :string           default("INDEFINIDO")
#  categoria_id     :integer
#

require 'test_helper'

class PublicacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
