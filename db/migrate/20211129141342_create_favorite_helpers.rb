class CreateFavoriteHelpers < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_helpers do |t|

      t.timestamps
    end
  end
end
