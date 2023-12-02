class CreateFotoRistorantes < ActiveRecord::Migration[7.0]
  def change
    create_table :foto_ristorantes do |t|
      t.string :url
      t.references :ristorante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
