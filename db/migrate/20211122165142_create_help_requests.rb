class CreateHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :help_requests do |t|
      t.time :start_time
      t.integer :duration
      t.text :task_description
      t.integer :status
      t.string :task_category

      t.timestamps
    end
  end
end
