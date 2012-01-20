class CreateProductcategories < ActiveRecord::Migration
  def change
    create_table :productcategories do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
