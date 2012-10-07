class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :order_uuid
      t.decimal :order_total, :precision => 7, :scale => 2
      t.string  :order_date
      t.boolean :order_done
      
      t.timestamps
    end
  end
end
