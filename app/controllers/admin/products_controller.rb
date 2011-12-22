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
#    field 'size'
#    field.text_area :text
     
    # field :created_at
    # field :updated_at
  end

end
