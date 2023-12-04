class DropFotoRecensioneTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :foto_recensiones
  end
end
