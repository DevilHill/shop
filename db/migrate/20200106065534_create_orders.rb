class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.integer  :user_id
      t.integer  :address_id
      t.float    :order_price
      t.integer  :status

      t.timestamps
    end
  end
end
