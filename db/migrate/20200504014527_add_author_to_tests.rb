class AddAuthorToTests < ActiveRecord::Migration[6.0]
  def change
  	add_reference :tests, :author, index: true
    add_foreign_key :tests, :users, column: :author_id, null: false
  end
end
