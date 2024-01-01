class Ristorante < ApplicationRecord
  belongs_to :tipo_cucina
  belongs_to :user
  has_many :recensiones
  has_many :prenotaziones

  has_many :foto_ristorantes, dependent: :destroy, inverse_of: :ristorante
  accepts_nested_attributes_for :foto_ristorantes, allow_destroy: true,reject_if: :all_blank

  has_many :piattos, dependent: :destroy, inverse_of: :ristorante
  accepts_nested_attributes_for :piattos, allow_destroy: true,reject_if: :all_blank

  has_many :likes, dependent: :destroy

  searchkick text_middle: %i[nome]

  def self.ransackable_attributes(auth_object = nil)
    ["cap", "citta", "created_at", "descrizione", "email", "id", "indirizzo", "latitudine", "longitudine", "nome", "oraapertura", "orachiusura", "provincia", "regione", "sitoweb1", "sitoweb2", "sitoweb3", "telefono", "tipo_cucina_id"]
  end

end
