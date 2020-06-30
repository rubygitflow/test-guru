class ChangeDataTypeForValueInBadges < ActiveRecord::Migration[6.0]
  def up
    #change column type form int to  string
    change_column :badges, :value, :string
  end
end
