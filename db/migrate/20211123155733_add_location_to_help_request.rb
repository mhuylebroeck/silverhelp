class AddLocationToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :location, :string
  end
end
