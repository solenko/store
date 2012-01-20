class Category < ActiveRecord::Base
  has_many :productcategories, :dependent => :destroy
  has_many :products, :through => :productcategories
  accepts_nested_attributes_for :productcategories
  accepts_nested_attributes_for :products
  acts_as_nested_set
  accepts_nested_attributes_for :children, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  validates_presence_of :name
end
