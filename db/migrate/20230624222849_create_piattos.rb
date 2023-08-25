class CreatePiattos < ActiveRecord::Migration[7.0]
  def change
    create_table :piattos do |t|
      t.string :nome
      t.text :descrizione

      t.timestamps
    end
  end
end
