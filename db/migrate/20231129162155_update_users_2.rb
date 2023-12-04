class UpdateUsers2 < ActiveRecord::Migration[7.0]
  def change
    add_column(:users, :nome, :string, limit: 50 , null: false , default: '')
    add_column(:users, :cognome, :string, limit: 50 , null: false , default: '')
    add_column(:users, :citta, :string, limit: 50 , null: false , default: '')
    add_column(:users, :provincia, :string, limit: 50 , null: false , default: '')
    add_column(:users, :cap, :string, limit: 10 , null: false , default: '')
    add_column(:users, :ristoratore, :string, limit: 10 , null: false , default: 'No')
    add_column(:users, :avatar, :string, limit: 500 , null: false , default: '')
  end
end
