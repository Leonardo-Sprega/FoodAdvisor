require "test_helper"

class PrenotazionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prenotazione = prenotaziones(:one)
  end
 
  test "should get index" do
    get prenotaziones_url
    assert_response :success
  end

  test "should get new" do
    get new_prenotazione_url
    assert_response :success
  end

  test "should create prenotazione" do
    assert_difference("Prenotazione.count") do
      post prenotaziones_url, params: { prenotazione: { cognomecliente: @prenotazione.cognomecliente, data: @prenotazione.data, emailcliente: @prenotazione.emailcliente, messaggio: @prenotazione.messaggio, nadulti: @prenotazione.nadulti, nbambini: @prenotazione.nbambini, nomecliente: @prenotazione.nomecliente, ora: @prenotazione.ora, ristorante_id: @prenotazione.ristorante_id, telefonocliente: @prenotazione.telefonocliente, user_id: @prenotazione.user_id } }
    end

    assert_redirected_to prenotazione_url(Prenotazione.last)
  end

  test "should show prenotazione" do
    get prenotazione_url(@prenotazione)
    assert_response :success
  end

  test "should get edit" do
    get edit_prenotazione_url(@prenotazione)
    assert_response :success
  end

  test "should update prenotazione" do
    patch prenotazione_url(@prenotazione), params: { prenotazione: { cognomecliente: @prenotazione.cognomecliente, data: @prenotazione.data, emailcliente: @prenotazione.emailcliente, messaggio: @prenotazione.messaggio, nadulti: @prenotazione.nadulti, nbambini: @prenotazione.nbambini, nomecliente: @prenotazione.nomecliente, ora: @prenotazione.ora, ristorante_id: @prenotazione.ristorante_id, telefonocliente: @prenotazione.telefonocliente, user_id: @prenotazione.user_id } }
    assert_redirected_to prenotazione_url(@prenotazione)
  end

  test "should destroy prenotazione" do
    assert_difference("Prenotazione.count", -1) do
      delete prenotazione_url(@prenotazione)
    end

    assert_redirected_to prenotaziones_url
  end
end
