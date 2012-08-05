class Food < ActiveRecord::Base
  
  attr_accessible :food_name, :food_price, :food_ingredient, 
                  :food_image_url, :place_id
   
  validates :food_name, :presence => true, :length => 1..255
  validates :food_price, :presence => true, :length => 1..255
  validates :food_ingredient, :presence => true, :length => 1..255
  validates :food_image_url, :presence => true, :length => 1..255
  
  belongs_to :place
end
