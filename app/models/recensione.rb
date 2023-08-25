class Recensione < ApplicationRecord
  belongs_to :utente
  belongs_to :ristorante

  has_many :like_recensiones, dependent: :destroy
end
