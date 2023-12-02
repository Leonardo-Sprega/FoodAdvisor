class AddFoto1ToRecensiones < ActiveRecord::Migration[7.0]
  def change
    add_column :recensiones, :foto1, :string
  end
end
