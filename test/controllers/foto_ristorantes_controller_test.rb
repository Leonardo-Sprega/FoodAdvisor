require "test_helper"

class FotoRistorantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foto_ristorante = foto_ristorantes(:one)
  end

  test "should get index" do
    get foto_ristorantes_url
    assert_response :success
  end

  test "should get new" do
    get new_foto_ristorante_url
    assert_response :success
  end

  test "should create foto_ristorante" do
    assert_difference("FotoRistorante.count") do
      post foto_ristorantes_url, params: { foto_ristorante: { ristorante_id: @foto_ristorante.ristorante_id, url: @foto_ristorante.url } }
    end

    assert_redirected_to foto_ristorante_url(FotoRistorante.last)
  end

  test "should show foto_ristorante" do
    get foto_ristorante_url(@foto_ristorante)
    assert_response :success
  end

  test "should get edit" do
    get edit_foto_ristorante_url(@foto_ristorante)
    assert_response :success
  end

  test "should update foto_ristorante" do
    patch foto_ristorante_url(@foto_ristorante), params: { foto_ristorante: { ristorante_id: @foto_ristorante.ristorante_id, url: @foto_ristorante.url } }
    assert_redirected_to foto_ristorante_url(@foto_ristorante)
  end

  test "should destroy foto_ristorante" do
    assert_difference("FotoRistorante.count", -1) do
      delete foto_ristorante_url(@foto_ristorante)
    end

    assert_redirected_to foto_ristorantes_url
  end
end
