class Productsize < ActiveRecord::Base
  belongs_to :product, :counter_cache => true
  belongs_to :size

#  validates :amount, :numericality => true
end
