require "test_helper"

class TipoCucinasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cucina = tipo_cucinas(:one)
  end

  test "should get index" do
    get tipo_cucinas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_cucina_url
    assert_response :success
  end

  test "should create tipo_cucina" do
    assert_difference("TipoCucina.count") do
      post tipo_cucinas_url, params: { tipo_cucina: { descrizione: @tipo_cucina.descrizione, nome: @tipo_cucina.nome } }
    end

    assert_redirected_to tipo_cucina_url(TipoCucina.last)
  end

  test "should show tipo_cucina" do
    get tipo_cucina_url(@tipo_cucina)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_cucina_url(@tipo_cucina)
    assert_response :success
  end

  test "should update tipo_cucina" do
    patch tipo_cucina_url(@tipo_cucina), params: { tipo_cucina: { descrizione: @tipo_cucina.descrizione, nome: @tipo_cucina.nome } }
    assert_redirected_to tipo_cucina_url(@tipo_cucina)
  end

  test "should destroy tipo_cucina" do
    assert_difference("TipoCucina.count", -1) do
      delete tipo_cucina_url(@tipo_cucina)
    end

    assert_redirected_to tipo_cucinas_url
  end
end
