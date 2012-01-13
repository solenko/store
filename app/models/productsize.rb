class Productsize < ActiveRecord::Base
  belongs_to :product
  belongs_to :size

#  validates :product_id, :size_id, :amount
end
