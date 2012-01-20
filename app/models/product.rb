class Product < ActiveRecord::Base
  belongs_to :category
  has_many :productsizes
  has_many :sizes, :through => :productsizes
  accepts_nested_attributes_for :productsizes, :reject_if => lambda { |a| a[:amount].blank? || a[:amount].to_i < 1 }, :allow_destroy => true
  accepts_nested_attributes_for :sizes

  validates :art, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => true
  
#  before_create :mark_sizes_for_removal
#  before_update :mark_sizes_for_removal
#
#
  private
    def mark_sizes_for_removal
      if valid?
        productsizes.each do |ps|
          
          puts ps.inspect
          puts ps.class
          puts ps.amount
          puts "blank? = #{ps.amount.blank?}"
          puts "amount == 0 -> #{ps.amount == 0}"
          ps.mark_for_destruction if ps.amount.to_i < 1 || ps.amount.blank?
          puts "marked_for_destruction? = #{ps.marked_for_destruction?}"
          end
        end
#      end
    end


end
