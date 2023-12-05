class AddUtenteToRistorante < ActiveRecord::Migration[7.0]
  def change
    add_reference :ristorantes, :user, null: false, foreign_key: true
  end
end
