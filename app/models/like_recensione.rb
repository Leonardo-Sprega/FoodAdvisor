class LikeRecensione < ApplicationRecord
  validates :user_id, uniqueness:{scope: :recensione_id}
  # Ex:- scope :active, -> {where(:active => true)}}
  belongs_to :recensione
  belongs_to :user
end
