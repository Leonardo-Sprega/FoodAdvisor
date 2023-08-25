class LikeRecensione < ApplicationRecord
  validates :utente_id, uniqueness:{scope: :recensione_id}
  # Ex:- scope :active, -> {where(:active => true)}}
  belongs_to :recensione
  belongs_to :utente
end
