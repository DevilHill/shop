class CreateSmallCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :small_categories do |t|

      t.integer :category_id        #大分类id与category关联
      t.string  :small_title        #小分类名字

      t.timestamps
    end
  end
end
