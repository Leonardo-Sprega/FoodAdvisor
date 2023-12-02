require "test_helper"

class RistorantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ristorante = ristorantes(:one)
  end
  
  test "should get index" do
    get ristorantes_url
    assert_response :success
  end

  test "should get new" do
    get new_ristorante_url
    assert_response :success
  end

  test "should create ristorante" do
    assert_difference("Ristorante.count") do
      post ristorantes_url, params: { ristorante: { cap: @ristorante.cap, citta: @ristorante.citta, descrizione: @ristorante.descrizione, email: @ristorante.email, indirizzo: @ristorante.indirizzo, nome: @ristorante.nome, oraapertura: @ristorante.oraapertura, orachiusura: @ristorante.orachiusura, provincia: @ristorante.provincia, regione: @ristorante.regione, sitoweb1: @ristorante.sitoweb1, sitoweb2: @ristorante.sitoweb2, sitoweb3: @ristorante.sitoweb3, telefono: @ristorante.telefono, tipo_cucina_id: @ristorante.tipo_cucina_id } }
    end

    assert_redirected_to ristorante_url(Ristorante.last)
  end

  test "should show ristorante" do
    get ristorante_url(@ristorante)
    assert_response :success
  end

  test "should get edit" do
    get edit_ristorante_url(@ristorante)
    assert_response :success
  end

  test "should update ristorante" do
    patch ristorante_url(@ristorante), params: { ristorante: { cap: @ristorante.cap, citta: @ristorante.citta, descrizione: @ristorante.descrizione, email: @ristorante.email, indirizzo: @ristorante.indirizzo, nome: @ristorante.nome, oraapertura: @ristorante.oraapertura, orachiusura: @ristorante.orachiusura, provincia: @ristorante.provincia, regione: @ristorante.regione, sitoweb1: @ristorante.sitoweb1, sitoweb2: @ristorante.sitoweb2, sitoweb3: @ristorante.sitoweb3, telefono: @ristorante.telefono, tipo_cucina_id: @ristorante.tipo_cucina_id } }
    assert_redirected_to ristorante_url(@ristorante)
  end

  test "should destroy ristorante" do
    assert_difference("Ristorante.count", -1) do
      delete ristorante_url(@ristorante)
    end

    assert_redirected_to ristorantes_url
  end
end
