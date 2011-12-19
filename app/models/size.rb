class Size < ActiveRecord::Base
  has_many :productsizes
  has_many :products, :through => :productsizes
end
