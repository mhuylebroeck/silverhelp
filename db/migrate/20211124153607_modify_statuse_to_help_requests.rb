class ModifyStatuseToHelpRequests < ActiveRecord::Migration[6.0]
  def change
    change_column_default :help_requests, :status, from: nil, to: 0
  end
end
