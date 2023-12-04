require "test_helper"

class RecensionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recensione = recensiones(:one)
  end
 
  test "should get index" do
    get recensiones_url
    assert_response :success
  end

  test "should get new" do
    get new_recensione_url
    assert_response :success
  end

  test "should create recensione" do
    assert_difference("Recensione.count") do
      post recensiones_url, params: { recensione: { commento: @recensione.commento, datarecensione: @recensione.datarecensione, datavisita: @recensione.datavisita, prezzo: @recensione.prezzo, ristorante_id: @recensione.ristorante_id, titolo: @recensione.titolo, user_id: @recensione.user_id, valutazione: @recensione.valutazione } }
    end

    assert_redirected_to recensione_url(Recensione.last)
  end

  test "should show recensione" do
    get recensione_url(@recensione)
    assert_response :success
  end

  test "should get edit" do
    get edit_recensione_url(@recensione)
    assert_response :success
  end

  test "should update recensione" do
    patch recensione_url(@recensione), params: { recensione: { commento: @recensione.commento, datarecensione: @recensione.datarecensione, datavisita: @recensione.datavisita, prezzo: @recensione.prezzo, ristorante_id: @recensione.ristorante_id, titolo: @recensione.titolo, user_id: @recensione.user_id, valutazione: @recensione.valutazione } }
    assert_redirected_to recensione_url(@recensione)
  end

  test "should destroy recensione" do
    assert_difference("Recensione.count", -1) do
      delete recensione_url(@recensione)
    end

    assert_redirected_to recensiones_url
  end
end
