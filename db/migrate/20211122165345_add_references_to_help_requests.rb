class AddReferencesToHelpRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :help_requests, :senior, foreign_key: { to_table: :users }
    add_reference :help_requests, :helper, foreign_key: { to_table: :users }
  end
end
