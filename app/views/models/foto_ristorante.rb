class FotoRistorante < ApplicationRecord
  belongs_to :ristorante
  validates :url, presence: true
end
