class AddLongitudineToRistorantes < ActiveRecord::Migration[7.0]
  def change
    add_column :ristorantes, :longitudine, :string
  end
end
