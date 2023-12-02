class AddFoto2ToRecensiones < ActiveRecord::Migration[7.0]
  def change
    add_column :recensiones, :foto2, :string
  end
end
