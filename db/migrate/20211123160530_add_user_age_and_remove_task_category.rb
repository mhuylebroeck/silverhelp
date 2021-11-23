class AddUserAgeAndRemoveTaskCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    remove_column :help_requests, :task_category
  end
end
