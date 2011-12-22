class AddNewColumnToProduct < ActiveRecord::Migration
  def change
     add_column :products, :new_product, :boolean
  end
end
