class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.references :list
      t.string :grocery_name
      t.float :increment
      t.string :unit
      t.integer :upc_code
      t.float :current_amount
      t.float :use_per_day

      t.timestamps
    end
    add_index :groceries, :list_id
  end
end
