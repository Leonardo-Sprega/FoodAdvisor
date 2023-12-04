class CreatePrenotaziones < ActiveRecord::Migration[7.0]
  def change
    create_table :prenotaziones do |t|
      t.time :ora
      t.datetime :data
      t.string :nomecliente
      t.string :cognomecliente
      t.integer :telefonocliente
      t.string :emailcliente
      t.integer :nadulti
      t.integer :nbambini
      t.text :messaggio
      t.references :user, null: false, foreign_key: true
      t.references :ristorante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
