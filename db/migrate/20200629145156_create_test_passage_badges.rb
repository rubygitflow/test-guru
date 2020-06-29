class CreateTestPassageBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passage_badges do |t|
      t.references :test_passage, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
