class UserUpdates < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :user_type, :string
    add_column :users, :vehicle, :boolean
    add_column :users, :points_balance, :integer
  end
end
