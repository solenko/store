class Product < ActiveRecord::Base
  has_many :productcategories, :dependent => :destroy
  has_many :categories, :through => :productcategories
  has_many :productimages

  has_many :productsizes, :dependent => :destroy
  has_many :sizes, :through => :productsizes

  accepts_nested_attributes_for :productsizes, :reject_if => lambda { |a| a[:amount].blank? || a[:amount].to_i < 1 }, :allow_destroy => true
  accepts_nested_attributes_for :productcategories, :allow_destroy => true
  accepts_nested_attributes_for :productimages, :reject_if => lambda { |a| a[:image].blank?}, :allow_destroy => true

  validates :art, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => true

end


