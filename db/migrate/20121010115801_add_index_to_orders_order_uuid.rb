class AddIndexToOrdersOrderUuid < ActiveRecord::Migration
  def change
    add_index :orders, :order_uuid
  end
end
