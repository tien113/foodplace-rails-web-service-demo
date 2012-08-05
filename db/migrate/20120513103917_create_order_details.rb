class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :food_name
      t.integer :food_count
      t.decimal :food_price, :precision => 7, :scale => 2
      t.string :food_place
      t.references :order

      t.timestamps
    end
    add_index :order_details, :order_id
  end
end
