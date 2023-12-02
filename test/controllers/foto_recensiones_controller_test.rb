require "test_helper"

class FotoRecensionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foto_recensione = foto_recensiones(:one)
  end

  

  test "should get index" do
    get foto_recensiones_url
    assert_response :success
  end

  test "should get new" do
    get new_foto_recensione_url
    assert_response :success
  end

  test "should create foto_recensione" do
    assert_difference("FotoRecensione.count") do
      post foto_recensiones_url, params: { foto_recensione: { recensione_id: @foto_recensione.recensione_id, url: @foto_recensione.url } }
    end

    assert_redirected_to foto_recensione_url(FotoRecensione.last)
  end

  test "should show foto_recensione" do
    get foto_recensione_url(@foto_recensione)
    assert_response :success
  end

  test "should get edit" do
    get edit_foto_recensione_url(@foto_recensione)
    assert_response :success
  end

  test "should update foto_recensione" do
    patch foto_recensione_url(@foto_recensione), params: { foto_recensione: { recensione_id: @foto_recensione.recensione_id, url: @foto_recensione.url } }
    assert_redirected_to foto_recensione_url(@foto_recensione)
  end

  test "should destroy foto_recensione" do
    assert_difference("FotoRecensione.count", -1) do
      delete foto_recensione_url(@foto_recensione)
    end

    assert_redirected_to foto_recensiones_url
  end
end
