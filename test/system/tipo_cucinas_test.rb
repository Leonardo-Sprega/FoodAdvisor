require "application_system_test_case"

class TipoCucinasTest < ApplicationSystemTestCase
  setup do
    @tipo_cucina = tipo_cucinas(:one)
  end

  test "visiting the index" do
    visit tipo_cucinas_url
    assert_selector "h1", text: "Tipo cucinas"
  end

  test "should create tipo cucina" do
    visit tipo_cucinas_url
    click_on "New tipo cucina"

    fill_in "Descrizione", with: @tipo_cucina.descrizione
    fill_in "Nome", with: @tipo_cucina.nome
    click_on "Create Tipo cucina"

    assert_text "Tipo cucina was successfully created"
    click_on "Back"
  end

  test "should update Tipo cucina" do
    visit tipo_cucina_url(@tipo_cucina)
    click_on "Edit this tipo cucina", match: :first

    fill_in "Descrizione", with: @tipo_cucina.descrizione
    fill_in "Nome", with: @tipo_cucina.nome
    click_on "Update Tipo cucina"

    assert_text "Tipo cucina was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo cucina" do
    visit tipo_cucina_url(@tipo_cucina)
    click_on "Destroy this tipo cucina", match: :first

    assert_text "Tipo cucina was successfully destroyed"
  end
end
