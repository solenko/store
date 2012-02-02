class Product < ActiveRecord::Base
  # before_validation(:on => :create) do
    # if productcategories { |a| a[:category_id].blank? }
      # errors[:base] << "This person is invalid because ..."
	# end
  # end
  
  # before_save :category_without_id 

  has_many :productcategories, :dependent => :destroy
  has_many :categories, :through => :productcategories
  has_many :productimages

  has_many :productsizes, :dependent => :destroy
  has_many :sizes, :through => :productsizes

  accepts_nested_attributes_for :productsizes, :allow_destroy => true
  accepts_nested_attributes_for :productcategories, :reject_if => lambda { |a| a[:category_id].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :productimages, :reject_if => lambda { |a| a[:image].blank? and a[:image_cache].blank? }, :allow_destroy => true

  validates :art, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => true
  validates_presence_of :productimages, :message => "не могут быть пустыми"
  validates_presence_of :productcategories, :message => "не могут быть пустыми"
    
  
  
  def category_without_id
    productcategories.each do |pc|
      pc.mark_for_destruction if pc.category_id.blank?
    end
  end
  
end


