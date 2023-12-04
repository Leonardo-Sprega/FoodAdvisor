class Like < ApplicationRecord
  validates :user_id, uniqueness:{scope: :ristorante_id}
  # Ex:- scope :active, -> {where(:active => true)}}
  belongs_to :ristorante
  belongs_to :user
end
