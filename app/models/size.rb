class Size < ActiveRecord::Base
  has_many :productsizes
  has_many :products, :through => :productsizes
  accepts_nested_attributes_for :productsizes
  accepts_nested_attributes_for :products
end
