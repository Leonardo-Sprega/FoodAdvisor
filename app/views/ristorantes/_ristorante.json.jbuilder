json.extract! ristorante, :id, :nome, :regione, :provincia, :citta, :indirizzo, :cap, :email, :telefono, :sitoweb1, :sitoweb2, :sitoweb3, :descrizione, :oraapertura, :orachiusura, :tipo_cucina_id, :created_at, :updated_at
json.url ristorante_url(ristorante, format: :json)
