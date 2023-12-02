class AddLatitudineToRistorantes < ActiveRecord::Migration[7.0]
  def change
    add_column :ristorantes, :latitudine, :string
  end
end
