class Product < ActiveRecord::Base
  belongs_to :category
  has_many :productsizes, :dependent => :destroy
  has_many :sizes, :through => :productsizes
  accepts_nested_attributes_for :productsizes, :allow_destroy => true
  accepts_nested_attributes_for :sizes

  validates :art, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => true
  
  before_create :mark_sizes_for_removal
  before_update :mark_sizes_for_removal
  

  private
    def mark_sizes_for_removal
      if valid?
        productsizes.each do |ps|
#          if ps.amount == 0 || ps.amount.blank?
          puts ps.inspect
          puts "blank? = #{ps.amount.blank?}"
          puts "amount == 0 -> #{ps.amount == 0}"
          ps.mark_for_destruction if ps.amount == 0 || ps.amount.blank?
          puts "marked_for_destruction? = #{ps.marked_for_destruction?}"
        end
#        end
      end
    end


end
