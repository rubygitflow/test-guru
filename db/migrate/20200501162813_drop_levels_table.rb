class DropLevelsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :levels
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
