class AddUnitOfTime < ActiveRecord::Migration
  def change
    add_column :groceries, :unit_of_time_estimated, :integer
  end
end
