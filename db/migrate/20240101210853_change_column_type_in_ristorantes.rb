class ChangeColumnTypeInRistorantes < ActiveRecord::Migration[7.0]
  def change
    change_column :ristorantes, :latitudine, :float
    change_column :ristorantes, :longitudine, :float
  end
end
