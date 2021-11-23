class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
