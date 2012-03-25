class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :grocery
      t.datetime :purchase_date
      t.float :purchase_amount
      t.float :unit_price

      t.timestamps
    end
    add_index :purchases, :grocery_id
  end
end
