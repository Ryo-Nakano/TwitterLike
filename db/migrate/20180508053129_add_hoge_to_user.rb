class AddHogeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unko, :string
  end
end
