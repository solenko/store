class Product < ActiveRecord::Base
  belongs_to :category
  has_many :productsizes
  has_many :sizes, :through => :productsizes
  accepts_nested_attributes_for :productsizes
  accepts_nested_attributes_for :sizes

  validates_presence_of :art
  validates_presence_of :name
  validates_presence_of :price

  validates_uniqueness_of :art
  validates_uniqueness_of :name

end
