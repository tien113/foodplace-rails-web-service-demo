class OrderDetail < ActiveRecord::Base
  
  attr_accessible :food_name, :food_count, :food_price, 
                  :food_place
  
  belongs_to :order
  
  validates :food_name, :presence => true, :length => 1..255
  validates :food_count, :presence => true, :length => 1..2
  validates :food_price, :presence => true, :length => 1..8
  validates :food_place, :presence => true, :length => 1..255
  
end
