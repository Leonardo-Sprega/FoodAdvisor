class Piatto < ApplicationRecord
    belongs_to :ristorante
    validates :speciale, inclusion: { in: [true, false] }
end
