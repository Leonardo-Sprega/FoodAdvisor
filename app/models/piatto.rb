class Piatto < ApplicationRecord
    belongs_to :ristorante, inverse_of: :piattos
    validates :speciale, inclusion: { in: [true, false] }
end
