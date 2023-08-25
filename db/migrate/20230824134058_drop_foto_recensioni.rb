class DropFotoRecensioni < ActiveRecord::Migration[7.0]
  def up
    drop_table :foto_recensiones
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
