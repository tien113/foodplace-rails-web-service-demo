class Food < ActiveRecord::Base
  belongs_to :place
  attr_accessible :food_name, :food_price, :food_ingredient, 
                  :food_image_url, :place_id
   
  validates :food_name, :presence => true, :length => 1..255
  validates :food_price, numericality: true, :length => 1..255
  validates :food_ingredient, :presence => true, :length => 1..255
  validates :food_image_url, :presence => true, :length => 1..255

end
