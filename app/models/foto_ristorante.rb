class FotoRistorante < ApplicationRecord
  belongs_to :ristorante, optional: true
  validates :url, presence: true
end
