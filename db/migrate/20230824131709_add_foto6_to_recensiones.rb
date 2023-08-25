class AddFoto6ToRecensiones < ActiveRecord::Migration[7.0]
  def change
    add_column :recensiones, :foto6, :string
  end
end
