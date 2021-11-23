class AddTaskandReferenceToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_reference :help_requests, :task, null: false, foreign_key: true
  end
end
