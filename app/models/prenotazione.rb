class Prenotazione < ApplicationRecord
  belongs_to :utente
  belongs_to :ristorante
end
