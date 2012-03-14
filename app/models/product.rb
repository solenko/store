class Product < ActiveRecord::Base

  before_save :product_sizes_without_amount

  has_many :productcategories, :dependent => :destroy
  has_many :categories, :through => :productcategories
  has_many :productimages, :dependent => :destroy

  has_many :productsizes, :dependent => :destroy
  has_many :sizes, :through => :productsizes

  accepts_nested_attributes_for :productsizes, :allow_destroy => true
  accepts_nested_attributes_for :productcategories, :reject_if => lambda { |a| a[:category_id].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :productimages, :reject_if => lambda { |a| a[:image].blank? and a[:image_cache].blank? }, :allow_destroy => true
  
  validate :product_categories_present
  validate :product_images_present
  validates :art, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true
  
  def product_categories_present
    if productcategories.nil? || productcategories.collect {|r| r.marked_for_destruction?}.all?
      errors[:base] << "У товара должна быть хотя бы одна категория."
    end
  end
  
  def product_images_present
    if productimages.nil? || productimages.collect {|r| r.marked_for_destruction?}.all?
      errors[:base] << "У товара должно быть хотя бы одно изображение"
    end
  end

  
  def product_sizes_without_amount
    productsizes.each do |pc|
      pc.mark_for_destruction if pc.amount.to_i < 1
    end
  end
  
end


