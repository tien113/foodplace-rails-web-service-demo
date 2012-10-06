class Place < ActiveRecord::Base
  has_many :foods
  attr_accessible :place_name, :place_lat, :place_log, :place_address,
                  :place_opening_time_1, :place_opening_time_2, :place_opening_time_3, :place_opening_time_4,
                  :place_phone_number, :place_email, :place_image_url
    
  validates :place_name, length: 1..255
  validates :place_lat, numericality: true, length: 1..255
  validates :place_log, numericality: true, length: 1..255
  validates :place_address, length: 1..255
  validates :place_opening_time_1, length: 1..255
  validates :place_phone_number, phone_number: true
  validates :place_image_url, length: 1..255

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :place_email, presence: true,
                          format: { with: VALID_EMAIL_REGEX }
end
