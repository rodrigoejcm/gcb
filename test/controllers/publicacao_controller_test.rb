require 'test_helper'

class PublicacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get titulo:string" do
    get publicacao_titulo:string_url
    assert_response :success
  end

  test "should get texto_publicacao:text" do
    get publicacao_texto_publicacao:text_url
    assert_response :success
  end

  test "should get references:usuario" do
    get publicacao_references:usuario_url
    assert_response :success
  end

  test "should get image:string" do
    get publicacao_image:string_url
    assert_response :success
  end

end
