json.extract! foto_ristorante, :id, :url, :ristorante_id, :created_at, :updated_at
json.url foto_ristorante_url(foto_ristorante, format: :json)
