class AddUtenteToRistorante < ActiveRecord::Migration[7.0]
  def change
    add_reference :ristorantes, :utente, null: false, foreign_key: true
  end
end
