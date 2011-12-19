class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :art
      t.text :description
      t.integer :price
      t.integer :seasson_id
      t.integer :category_id

      t.timestamps
    end
  end
end
