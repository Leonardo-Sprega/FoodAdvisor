json.extract! recensione, :id, :titolo, :commento, :datavisita, :datarecensione, :valutazione, :prezzo, :utente_id, :ristorante_id, :created_at, :updated_at
json.url recensione_url(recensione, format: :json)
