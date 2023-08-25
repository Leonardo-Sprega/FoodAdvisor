require "application_system_test_case"

class LikeRecensionesTest < ApplicationSystemTestCase
  setup do
    @like_recensione = like_recensiones(:one)
  end

  test "visiting the index" do
    visit like_recensiones_url
    assert_selector "h1", text: "Like recensiones"
  end

  test "should create like recensione" do
    visit like_recensiones_url
    click_on "New like recensione"

    fill_in "Recensione", with: @like_recensione.recensione_id
    fill_in "Utente", with: @like_recensione.utente_id
    click_on "Create Like recensione"

    assert_text "Like recensione was successfully created"
    click_on "Back"
  end

  test "should update Like recensione" do
    visit like_recensione_url(@like_recensione)
    click_on "Edit this like recensione", match: :first

    fill_in "Recensione", with: @like_recensione.recensione_id
    fill_in "Utente", with: @like_recensione.utente_id
    click_on "Update Like recensione"

    assert_text "Like recensione was successfully updated"
    click_on "Back"
  end

  test "should destroy Like recensione" do
    visit like_recensione_url(@like_recensione)
    click_on "Destroy this like recensione", match: :first

    assert_text "Like recensione was successfully destroyed"
  end
end
