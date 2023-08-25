class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :ristorante, null: false, foreign_key: true
      t.references :utente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
