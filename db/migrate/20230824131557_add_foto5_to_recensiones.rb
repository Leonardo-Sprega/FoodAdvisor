class AddFoto5ToRecensiones < ActiveRecord::Migration[7.0]
  def change
    add_column :recensiones, :foto5, :string
  end
end
