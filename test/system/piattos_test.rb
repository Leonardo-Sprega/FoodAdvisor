require "application_system_test_case"

class PiattosTest < ApplicationSystemTestCase
  setup do
    @piatto = piattos(:one)
  end

  test "visiting the index" do
    visit piattos_url
    assert_selector "h1", text: "Piattos"
  end

  test "should create piatto" do
    visit piattos_url
    click_on "New piatto"

    fill_in "Descrizione", with: @piatto.descrizione
    fill_in "Nome", with: @piatto.nome
    click_on "Create Piatto"

    assert_text "Piatto was successfully created"
    click_on "Back"
  end

  test "should update Piatto" do
    visit piatto_url(@piatto)
    click_on "Edit this piatto", match: :first

    fill_in "Descrizione", with: @piatto.descrizione
    fill_in "Nome", with: @piatto.nome
    click_on "Update Piatto"

    assert_text "Piatto was successfully updated"
    click_on "Back"
  end

  test "should destroy Piatto" do
    visit piatto_url(@piatto)
    click_on "Destroy this piatto", match: :first

    assert_text "Piatto was successfully destroyed"
  end
end
