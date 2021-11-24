class DeleteStartTimeToHelpRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :help_requests, :start_time
    add_column :help_requests, :start_time, :datetime
  end
end
