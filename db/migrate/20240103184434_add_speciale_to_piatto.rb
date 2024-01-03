class AddSpecialeToPiatto < ActiveRecord::Migration[7.0]
  def change
    add_column :piattos, :speciale, :boolean
  end
end
