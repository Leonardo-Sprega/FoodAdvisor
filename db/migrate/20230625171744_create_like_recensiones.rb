class CreateLikeRecensiones < ActiveRecord::Migration[7.0]
  def change
    create_table :like_recensiones do |t|
      t.references :recensione, null: false, foreign_key: true
      t.references :utente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
