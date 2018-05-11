class RemoveUnkoFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :user, :unko, :string
  end
end
