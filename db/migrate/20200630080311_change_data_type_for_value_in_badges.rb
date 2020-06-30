class ChangeDataTypeForValueInBadges < ActiveRecord::Migration[6.0]
  def up
    #change column type form int to  string
    change_column :badges, :value, :string
  end
  def down
    #change column type form int back to  integer
    change_column :badges, :value, :integer
  end
end
