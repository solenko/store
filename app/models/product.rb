class Product < ActiveRecord::Base
#  has_many :categories, :through => :productcategories
#  has_many :productcategories, :dependent => :destroy

  has_many :productsizes, :dependent => :destroy
  has_many :sizes, :through => :productsizes

  accepts_nested_attributes_for :productsizes, :reject_if => lambda { |a| a[:amount].blank? || a[:amount].to_i < 1 }, :allow_destroy => true

  validates :art, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => true
  
  private

    def must_have_children
    if children.empty? or children.all? {|child| child.marked_for_destruction? }
      errors.add_to_base("Must have at least one child")
    end
  end




