class CreateRecensiones < ActiveRecord::Migration[7.0]
  def change
    create_table :recensiones do |t|
      t.string :titolo
      t.text :commento
      t.datetime :datavisita
      t.datetime :datarecensione
      t.integer :valutazione
      t.integer :prezzo
      t.references :user, null: false, foreign_key: true
      t.references :ristorante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
