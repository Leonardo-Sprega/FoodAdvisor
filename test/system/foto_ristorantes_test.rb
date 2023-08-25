require "application_system_test_case"

class FotoRistorantesTest < ApplicationSystemTestCase
  setup do
    @foto_ristorante = foto_ristorantes(:one)
  end

  test "visiting the index" do
    visit foto_ristorantes_url
    assert_selector "h1", text: "Foto ristorantes"
  end

  test "should create foto ristorante" do
    visit foto_ristorantes_url
    click_on "New foto ristorante"

    fill_in "Ristorante", with: @foto_ristorante.ristorante_id
    fill_in "Url", with: @foto_ristorante.url
    click_on "Create Foto ristorante"

    assert_text "Foto ristorante was successfully created"
    click_on "Back"
  end

  test "should update Foto ristorante" do
    visit foto_ristorante_url(@foto_ristorante)
    click_on "Edit this foto ristorante", match: :first

    fill_in "Ristorante", with: @foto_ristorante.ristorante_id
    fill_in "Url", with: @foto_ristorante.url
    click_on "Update Foto ristorante"

    assert_text "Foto ristorante was successfully updated"
    click_on "Back"
  end

  test "should destroy Foto ristorante" do
    visit foto_ristorante_url(@foto_ristorante)
    click_on "Destroy this foto ristorante", match: :first

    assert_text "Foto ristorante was successfully destroyed"
  end
end
