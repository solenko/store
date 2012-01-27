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
  validates :productimages, :presence => true, :on => :save
  validates_presence_of :productcategories, :message => "^Choose category"

  before_update :category_without_id
  
  private

  def category_without_id
    productcategories.each do |pc|
      pc.mark_for_destruction if pc.category_id.blank?
    end
  end
end


