class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      #中间表
      t.integer :order_id        #订单ID
      t.integer :product_id      #商品ID

      t.timestamps
    end
  end
end
