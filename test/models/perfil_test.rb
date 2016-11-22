# == Schema Information
#
# Table name: perfis
#
#  id           :integer          not null, primary key
#  imagemPerfil :string
#  usuario_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  descricao    :text
#  imagemCapa   :string
#  datacap      :date
#  datagcb      :date
#  corda        :string
#

require 'test_helper'

class PerfilTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
