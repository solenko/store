class Product < ActiveRecord::Base
  belongs_to :seasson
  belongs_to :category
  has_many :productsizes
  has_many :sizes, :through => :productsizes
  accepts_nested_attributes_for :productsizes
  accepts_nested_attributes_for :sizes
end
