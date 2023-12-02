class CreateTipoCucinas < ActiveRecord::Migration[7.0]
  def change
    create_table :tipo_cucinas do |t|
      t.string :nome
      t.text :descrizione

      t.timestamps
    end
  end
end
