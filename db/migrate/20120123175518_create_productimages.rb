class CreateProductimages < ActiveRecord::Migration
  def change
    create_table :productimages do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
