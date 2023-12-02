class AddFoto3ToRecensiones < ActiveRecord::Migration[7.0]
  def change
    add_column :recensiones, :foto3, :string
  end
end
