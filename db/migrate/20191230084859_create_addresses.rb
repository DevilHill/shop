class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.integer :user_id        #用户id（外键）
      t.string  :province       #省
      t.string  :city           #市
      t.string  :region         #区
      t.string  :detail         #详细地址
      t.string  :receiver       #收货人

      t.timestamps
    end
  end
end
