class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :help_request_references
      t.text :description
      t.integer :friendliness_rating
      t.integer :efficiency_rating
      t.integer :punctuality_rating
      t.boolean :recommend

      t.timestamps
    end
  end
end
