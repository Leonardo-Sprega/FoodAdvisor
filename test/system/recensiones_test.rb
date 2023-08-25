require "application_system_test_case"

class RecensionesTest < ApplicationSystemTestCase
  setup do
    @recensione = recensiones(:one)
  end

  test "visiting the index" do
    visit recensiones_url
    assert_selector "h1", text: "Recensiones"
  end

  test "should create recensione" do
    visit recensiones_url
    click_on "New recensione"

    fill_in "Commento", with: @recensione.commento
    fill_in "Datarecensione", with: @recensione.datarecensione
    fill_in "Datavisita", with: @recensione.datavisita
    fill_in "Prezzo", with: @recensione.prezzo
    fill_in "Ristorante", with: @recensione.ristorante_id
    fill_in "Titolo", with: @recensione.titolo
    fill_in "Utente", with: @recensione.utente_id
    fill_in "Valutazione", with: @recensione.valutazione
    click_on "Create Recensione"

    assert_text "Recensione was successfully created"
    click_on "Back"
  end

  test "should update Recensione" do
    visit recensione_url(@recensione)
    click_on "Edit this recensione", match: :first

    fill_in "Commento", with: @recensione.commento
    fill_in "Datarecensione", with: @recensione.datarecensione
    fill_in "Datavisita", with: @recensione.datavisita
    fill_in "Prezzo", with: @recensione.prezzo
    fill_in "Ristorante", with: @recensione.ristorante_id
    fill_in "Titolo", with: @recensione.titolo
    fill_in "Utente", with: @recensione.utente_id
    fill_in "Valutazione", with: @recensione.valutazione
    click_on "Update Recensione"

    assert_text "Recensione was successfully updated"
    click_on "Back"
  end

  test "should destroy Recensione" do
    visit recensione_url(@recensione)
    click_on "Destroy this recensione", match: :first

    assert_text "Recensione was successfully destroyed"
  end
end
