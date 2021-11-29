class AddReferencesToFavoriteHelper < ActiveRecord::Migration[6.0]
  def change
    add_reference :favorites, :senior, foreign_key: { to_table: :users }
    add_reference :favorites, :helper, foreign_key: { to_table: :users }
  end
end
