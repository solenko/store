class Admin::CategoriesController < Puffer::Base

  setup do
    group :categories
  end

  index do
    # field :id
    field :name
    field :position
    # field :created_at
    # field :updated_at
  end

  form do
    # field :id
    field :name
    field :position
    # field :created_at
    # field :updated_at
  end

end
