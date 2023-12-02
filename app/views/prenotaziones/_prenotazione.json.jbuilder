json.extract! prenotazione, :id, :ora, :data, :nomecliente, :cognomecliente, :telefonocliente, :emailcliente, :nadulti, :nbambini, :messaggio, :utente_id, :ristorante_id, :created_at, :updated_at
json.url prenotazione_url(prenotazione, format: :json)
