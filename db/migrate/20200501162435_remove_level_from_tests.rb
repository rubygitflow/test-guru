class RemoveLevelFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tests, :level, null: false, foreign_key: true
  end
end
