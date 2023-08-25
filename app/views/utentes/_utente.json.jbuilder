json.extract! utente, :id, :username, :nome, :cognome, :cap_regione, :telefono, :email, :password, :ristoratore, :avatar, :created_at, :updated_at
json.url utente_url(utente, format: :json)
