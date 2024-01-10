require "rails_helper"

describe "User signs in", type: :system do

  it "logs in successfully" do
    visit root_path
    click_button "Login"
    fill_in "user_email", with: "provatest@gmail.com"
    fill_in "password", with: "Qq!11111"
    click_button "Accedi"

    expect(page).to have_button "Log out"
    expect(page).to have_current_path(root_path)
  end

  it "fails to log in with invalid credentials" do
    visit root_path
    click_button "Login"
    fill_in "user_email", with: Faker::Internet.email
    fill_in "password", with: "invalid_password"
    click_button "Accedi"

    expect(page).to have_content "Errore nell'accesso, riprovare"
    expect(page).to have_current_path(new_user_session_path)
  end
  it "registers a new user successfully" do
    visit root_path
    click_button "Login"
    click_button "Registrati"

    fill_in "user_email", with: Faker::Internet.email
    fill_in "password", with: "Qq!11111"
    fill_in "user_password_confirmation", with: "Qq!11111"
    fill_in "user_nome", with: Faker::Name.first_name
    fill_in "user_cognome", with: Faker::Name.last_name
    fill_in "user_citta", with: Faker::Address.city
    fill_in "user_cap", with: Faker::Number.number(digits: 5)
    fill_in "user_provincia", with: Faker::Address.state
    select "Si", from: "user_ristoratore"

    click_button "Registrati"

    expect(page).to have_current_path(root_path)

    click_link "Hai un ristorante?"

    expect(page).to have_current_path(new_ristorante_path)

    fill_in 'ristorante_nome', with: Faker::Restaurant.name
    fill_in 'ristorante_email', with: Faker::Internet.email
    fill_in 'ristorante_telefono', with: 123456789
    fill_in 'ristorante_regione', with: Faker::Address.state
    fill_in 'ristorante_provincia', with: Faker::Address.state_abbr
    fill_in 'ristorante_citta', with: Faker::Address.city
    fill_in 'ristorante_indirizzo', with: "Via test prova ,32"
    fill_in 'ristorante_cap', with: Faker::Address.zip_code
    fill_in 'ristorante_oraapertura', with: '08:00' 
    fill_in 'ristorante_orachiusura', with: '16:00' 
    select "italiana", from: "ristorante[tipo_cucina_id]"
    fill_in 'ristorante_descrizione', with: Faker::Lorem.paragraph


    fill_in 'ristorante[piattos_attributes][0][nome]', with: "carbonara"
    fill_in 'ristorante[piattos_attributes][0][descrizione]', with: "è buona"
    fill_in 'ristorante[piattos_attributes][0][prezzo]', with: 12


    fill_in 'ristorante[foto_ristorantes_attributes][0][url]', with: "https://media-assets.lacucinaitaliana.it/photos/61fac2ad07be724774c9c5a9/16:9/w_2240,c_limit/Cena-a-Como-portrait.jpg"

    click_button 'Create Ristorante'

    expect(page).to have_current_path(ristorante_path(Ristorante.last))



    
  end

end