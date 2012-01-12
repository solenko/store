class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :art
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :new_product

      t.timestamps
    end
  end
end
