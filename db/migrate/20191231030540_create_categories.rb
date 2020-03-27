class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|

      t.string :big_title         #大分类名字

      t.timestamps
    end
  end
end
