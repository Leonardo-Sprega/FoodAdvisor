class RemoveDatarecensioneFromRecensione < ActiveRecord::Migration[7.0]
  def change
    remove_column :recensiones, :datarecensione, :datetime
  end
end
