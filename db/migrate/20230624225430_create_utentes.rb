class CreateUtentes < ActiveRecord::Migration[7.0]
  def change
    create_table :utentes do |t|
      t.string :username
      t.string :nome
      t.string :cognome
      t.string :cap_regione
      t.integer :telefono
      t.string :email
      t.string :password
      t.string :ristoratore
      t.string :avatar

      t.timestamps
    end
  end
end
