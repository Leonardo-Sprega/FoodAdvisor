require "application_system_test_case"

class RistorantesTest < ApplicationSystemTestCase
  setup do
    @ristorante = ristorantes(:one)
  end

  test "visiting the index" do
    visit ristorantes_url
    assert_selector "h1", text: "Ristorantes"
  end

  test "should create ristorante" do
    visit ristorantes_url
    click_on "New ristorante"

    fill_in "Cap", with: @ristorante.cap
    fill_in "Citta", with: @ristorante.citta
    fill_in "Descrizione", with: @ristorante.descrizione
    fill_in "Email", with: @ristorante.email
    fill_in "Indirizzo", with: @ristorante.indirizzo
    fill_in "Nome", with: @ristorante.nome
    fill_in "Oraapertura", with: @ristorante.oraapertura
    fill_in "Orachiusura", with: @ristorante.orachiusura
    fill_in "Provincia", with: @ristorante.provincia
    fill_in "Regione", with: @ristorante.regione
    fill_in "Sitoweb1", with: @ristorante.sitoweb1
    fill_in "Sitoweb2", with: @ristorante.sitoweb2
    fill_in "Sitoweb3", with: @ristorante.sitoweb3
    fill_in "Telefono", with: @ristorante.telefono
    fill_in "Tipo cucina", with: @ristorante.tipo_cucina_id
    click_on "Create Ristorante"

    assert_text "Ristorante was successfully created"
    click_on "Back"
  end

  test "should update Ristorante" do
    visit ristorante_url(@ristorante)
    click_on "Edit this ristorante", match: :first

    fill_in "Cap", with: @ristorante.cap
    fill_in "Citta", with: @ristorante.citta
    fill_in "Descrizione", with: @ristorante.descrizione
    fill_in "Email", with: @ristorante.email
    fill_in "Indirizzo", with: @ristorante.indirizzo
    fill_in "Nome", with: @ristorante.nome
    fill_in "Oraapertura", with: @ristorante.oraapertura
    fill_in "Orachiusura", with: @ristorante.orachiusura
    fill_in "Provincia", with: @ristorante.provincia
    fill_in "Regione", with: @ristorante.regione
    fill_in "Sitoweb1", with: @ristorante.sitoweb1
    fill_in "Sitoweb2", with: @ristorante.sitoweb2
    fill_in "Sitoweb3", with: @ristorante.sitoweb3
    fill_in "Telefono", with: @ristorante.telefono
    fill_in "Tipo cucina", with: @ristorante.tipo_cucina_id
    click_on "Update Ristorante"

    assert_text "Ristorante was successfully updated"
    click_on "Back"
  end

  test "should destroy Ristorante" do
    visit ristorante_url(@ristorante)
    click_on "Destroy this ristorante", match: :first

    assert_text "Ristorante was successfully destroyed"
  end
end
