class Admin::SeassonsController < Puffer::Base

  setup do
    group :seassons
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
