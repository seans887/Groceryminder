class AddItemUseEstimate < ActiveRecord::Migration
  def change
    rename_column :groceries, :use_per_day, :use_per_day_actual
    add_column :groceries, :use_per_day_estimate, :float
  end
end
