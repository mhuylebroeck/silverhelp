class AddPointsToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :points_balance
    add_column :users, :points_balance, :integer, default: 0
  end
end
