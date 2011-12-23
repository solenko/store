class Admin::ProductsController < Puffer::Base

  setup do
    group :products
  end

  index do
    # field :id
    field :art
    field :description
    field :price
    field 'seasson.name'
    field 'category.name'
    field :new_product
    field 'productsizes.collect {|a| a.size.code}', :html => { :name => 3 }
    field 'productsizes.collect {|a| a.amount}'
    # field :created_at
    # field :updated_at
  end

  form do
    # field :id
    field :art
    field :description
    field :price
    field :seasson_id, :select => Seasson.all.collect {|s| [ s.name, s.id ] }
    field :category_id, :select => Category.all.collect {|c| [ c.name, c.id ] }
    field :new_product
    field :productsizes do
      field :size_id, :select => Size.all.collect {|c| [ c.code, c.id ] };
      field :amount
    end
#    field.text_area :text
     
    # field :created_at
    # field :updated_at
  end

end
