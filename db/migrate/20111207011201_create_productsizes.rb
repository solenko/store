class CreateProductsizes < ActiveRecord::Migration
  def change
    create_table :productsizes do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :amount

      t.timestamps
    end
  end
end
