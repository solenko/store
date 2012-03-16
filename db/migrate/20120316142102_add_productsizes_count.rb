class AddProductsizesCount < ActiveRecord::Migration
  def up
    add_column :products, :productsizes_count, :integer, :default => 0

    Product.reset_column_information
    Product.select(:id).find_each do |p|
      p.update_attribute(:productsizes_count, p.productsizes.count)
    end
  end

  def down
    remove_column :products, :productsizes_count
  end
end
