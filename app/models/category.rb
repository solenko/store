class Category < ActiveRecord::Base
  has_many :products
  acts_as_nested_set
  accepts_nested_attributes_for :children, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
