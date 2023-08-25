require "test_helper"

class LikeRecensionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_recensione = like_recensiones(:one)
  end

  test "should get index" do
    get like_recensiones_url
    assert_response :success
  end

  test "should get new" do
    get new_like_recensione_url
    assert_response :success
  end

  test "should create like_recensione" do
    assert_difference("LikeRecensione.count") do
      post like_recensiones_url, params: { like_recensione: { recensione_id: @like_recensione.recensione_id, utente_id: @like_recensione.utente_id } }
    end

    assert_redirected_to like_recensione_url(LikeRecensione.last)
  end

  test "should show like_recensione" do
    get like_recensione_url(@like_recensione)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_recensione_url(@like_recensione)
    assert_response :success
  end

  test "should update like_recensione" do
    patch like_recensione_url(@like_recensione), params: { like_recensione: { recensione_id: @like_recensione.recensione_id, utente_id: @like_recensione.utente_id } }
    assert_redirected_to like_recensione_url(@like_recensione)
  end

  test "should destroy like_recensione" do
    assert_difference("LikeRecensione.count", -1) do
      delete like_recensione_url(@like_recensione)
    end

    assert_redirected_to like_recensiones_url
  end
end
