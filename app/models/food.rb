class Food < ActiveRecord::Base
  belongs_to :place
  attr_accessible :food_name, :food_price, :food_ingredient, 
                  :food_image_url, :place_id
   
  validates :food_name, length: 1..255
  validates :food_price, numericality: true, length: 1..255
  validates :food_ingredient, length: 1..255
  validates :food_image_url, length: 1..255
  validates :place_id, presence: true

end
