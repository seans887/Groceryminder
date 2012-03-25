class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :groceries, :increment, :unit_increment
  end

  def down
  end
end
