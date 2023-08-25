require "application_system_test_case"

class PrenotazionesTest < ApplicationSystemTestCase
  setup do
    @prenotazione = prenotaziones(:one)
  end

  test "visiting the index" do
    visit prenotaziones_url
    assert_selector "h1", text: "Prenotaziones"
  end

  test "should create prenotazione" do
    visit prenotaziones_url
    click_on "New prenotazione"

    fill_in "Cognomecliente", with: @prenotazione.cognomecliente
    fill_in "Data", with: @prenotazione.data
    fill_in "Emailcliente", with: @prenotazione.emailcliente
    fill_in "Messaggio", with: @prenotazione.messaggio
    fill_in "Nadulti", with: @prenotazione.nadulti
    fill_in "Nbambini", with: @prenotazione.nbambini
    fill_in "Nomecliente", with: @prenotazione.nomecliente
    fill_in "Ora", with: @prenotazione.ora
    fill_in "Ristorante", with: @prenotazione.ristorante_id
    fill_in "Telefonocliente", with: @prenotazione.telefonocliente
    fill_in "Utente", with: @prenotazione.utente_id
    click_on "Create Prenotazione"

    assert_text "Prenotazione was successfully created"
    click_on "Back"
  end

  test "should update Prenotazione" do
    visit prenotazione_url(@prenotazione)
    click_on "Edit this prenotazione", match: :first

    fill_in "Cognomecliente", with: @prenotazione.cognomecliente
    fill_in "Data", with: @prenotazione.data
    fill_in "Emailcliente", with: @prenotazione.emailcliente
    fill_in "Messaggio", with: @prenotazione.messaggio
    fill_in "Nadulti", with: @prenotazione.nadulti
    fill_in "Nbambini", with: @prenotazione.nbambini
    fill_in "Nomecliente", with: @prenotazione.nomecliente
    fill_in "Ora", with: @prenotazione.ora
    fill_in "Ristorante", with: @prenotazione.ristorante_id
    fill_in "Telefonocliente", with: @prenotazione.telefonocliente
    fill_in "Utente", with: @prenotazione.utente_id
    click_on "Update Prenotazione"

    assert_text "Prenotazione was successfully updated"
    click_on "Back"
  end

  test "should destroy Prenotazione" do
    visit prenotazione_url(@prenotazione)
    click_on "Destroy this prenotazione", match: :first

    assert_text "Prenotazione was successfully destroyed"
  end
end
