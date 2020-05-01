class AddLevelToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :level, :integer, default: 0
  end
end
