class ChangeModelName < ActiveRecord::Migration[6.0]
  def change
    rename_table :favorite_helpers, :favorites
  end
end
