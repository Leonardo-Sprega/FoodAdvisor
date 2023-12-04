class Recensione < ApplicationRecord
  belongs_to :user
  belongs_to :ristorante

  has_many :like_recensiones, dependent: :destroy
end
