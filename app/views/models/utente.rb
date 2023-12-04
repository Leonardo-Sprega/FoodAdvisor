class Utente < ApplicationRecord

    has_secure_password
    
    has_many :recensiones
    has_many :prenotaziones
    has_many :ristorantes
    has_many :likes
    has_many :like_recensiones
end
