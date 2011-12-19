class Admin::SizesController < Puffer::Base

  setup do
    group :sizes
  end

  index do
    # field :id
    field :code
    # field :created_at
    # field :updated_at
  end

  form do
    # field :id
    field :code
    # field :created_at
    # field :updated_at
  end

end
