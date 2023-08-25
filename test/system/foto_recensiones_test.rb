require "application_system_test_case"

class FotoRecensionesTest < ApplicationSystemTestCase
  setup do
    @foto_recensione = foto_recensiones(:one)
  end

  test "visiting the index" do
    visit foto_recensiones_url
    assert_selector "h1", text: "Foto recensiones"
  end

  test "should create foto recensione" do
    visit foto_recensiones_url
    click_on "New foto recensione"

    fill_in "Recensione", with: @foto_recensione.recensione_id
    fill_in "Url", with: @foto_recensione.url
    click_on "Create Foto recensione"

    assert_text "Foto recensione was successfully created"
    click_on "Back"
  end

  test "should update Foto recensione" do
    visit foto_recensione_url(@foto_recensione)
    click_on "Edit this foto recensione", match: :first

    fill_in "Recensione", with: @foto_recensione.recensione_id
    fill_in "Url", with: @foto_recensione.url
    click_on "Update Foto recensione"

    assert_text "Foto recensione was successfully updated"
    click_on "Back"
  end

  test "should destroy Foto recensione" do
    visit foto_recensione_url(@foto_recensione)
    click_on "Destroy this foto recensione", match: :first

    assert_text "Foto recensione was successfully destroyed"
  end
end
