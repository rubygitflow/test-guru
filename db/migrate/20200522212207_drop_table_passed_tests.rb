class DropTablePassedTests < ActiveRecord::Migration[6.0]
  def up
    drop_table :passed_tests, if_exists: true
  end
end
