class CreateRistorantes < ActiveRecord::Migration[7.0]
  def change
    create_table :ristorantes do |t|
      t.string :nome
      t.string :regione
      t.string :provincia
      t.string :citta
      t.string :indirizzo
      t.string :cap
      t.string :email
      t.integer :telefono
      t.string :sitoweb1
      t.string :sitoweb2
      t.string :sitoweb3
      t.text :descrizione
      t.time :oraapertura
      t.time :orachiusura
      t.references :tipo_cucina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
