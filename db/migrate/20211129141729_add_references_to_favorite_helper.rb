class AddReferencesToFavoriteHelper < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorite_helpers, :senior, foreign_key: { to_table: :users }
    add_reference :favorite_helpers, :helper, foreign_key: { to_table: :users }
  end
end
