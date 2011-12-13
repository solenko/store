class Product < ActiveRecord::Base
  belongs_to :seasson
  belongs_to :category
end
