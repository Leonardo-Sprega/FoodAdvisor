class Like < ApplicationRecord
  validates :utente_id, uniqueness:{scope: :ristorante_id}
  # Ex:- scope :active, -> {where(:active => true)}}
  belongs_to :ristorante
  belongs_to :utente
end
