# == Schema Information
#
# Table name: eventos
#
#  id               :integer          not null, primary key
#  titulo           :string(150)
#  descricao        :text
#  local            :string
#  data_hora_inicio :datetime
#  data_hora_fim    :datetime
#  aprovado         :string           default("INDEFINIDO")
#  usuario_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  image            :string
#

require 'test_helper'

class EventoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
