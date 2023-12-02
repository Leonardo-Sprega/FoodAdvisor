require "test_helper"

class PiattosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piatto = piattos(:one)
  end
  
  test "should get index" do
    get piattos_url
    assert_response :success
  end

  test "should get new" do
    get new_piatto_url
    assert_response :success
  end

  test "should create piatto" do
    assert_difference("Piatto.count") do
      post piattos_url, params: { piatto: { descrizione: @piatto.descrizione, nome: @piatto.nome } }
    end

    assert_redirected_to piatto_url(Piatto.last)
  end

  test "should show piatto" do
    get piatto_url(@piatto)
    assert_response :success
  end

  test "should get edit" do
    get edit_piatto_url(@piatto)
    assert_response :success
  end

  test "should update piatto" do
    patch piatto_url(@piatto), params: { piatto: { descrizione: @piatto.descrizione, nome: @piatto.nome } }
    assert_redirected_to piatto_url(@piatto)
  end

  test "should destroy piatto" do
    assert_difference("Piatto.count", -1) do
      delete piatto_url(@piatto)
    end

    assert_redirected_to piattos_url
  end
end
