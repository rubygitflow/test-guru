class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.references :level, null: false, index: true, foreign_key: true
      t.references :category, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
