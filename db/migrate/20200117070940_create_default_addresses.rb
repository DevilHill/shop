class CreateDefaultAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :default_addresses do |t|

      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end
  end
end
