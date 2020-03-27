class AddColumnNumIntoOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :num ,:integer
  end
end
