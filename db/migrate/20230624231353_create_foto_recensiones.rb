class CreateFotoRecensiones < ActiveRecord::Migration[7.0]
  def change
    create_table :foto_recensiones do |t|
      t.string :url
      t.references :recensione, null: false, foreign_key: true

      t.timestamps
    end
  end
end
