json.extract! foto_recensione, :id, :url, :recensione_id, :created_at, :updated_at
json.url foto_recensione_url(foto_recensione, format: :json)
