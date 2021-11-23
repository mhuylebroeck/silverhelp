class RemoveIncorrectString < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :help_request_references
    add_reference :reviews, :help_request, null: false, foreign_key: true
  end
end
