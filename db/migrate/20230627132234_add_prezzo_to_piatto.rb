class AddPrezzoToPiatto < ActiveRecord::Migration[7.0]
  def change
    add_column :piattos, :prezzo, :integer
  end
end
