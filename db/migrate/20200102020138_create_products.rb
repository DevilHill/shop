class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.integer  :small_category_id                     #小分类id(外键)
      t.string   :name                                  #商品名字
      t.string   :note                                  #商品详细说明
      t.float    :price                                 #商品价格
      t.integer  :status  , :default => 2               #商品状态（默认为2）1为上架，2为下架

      t.timestamps
    end
  end
end
