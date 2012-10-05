class Place < ActiveRecord::Base
  has_many :foods
  attr_accessible :place_name, :place_lat, :place_log, :place_address,
                  :place_opening_time_1, :place_opening_time_2, :place_opening_time_3, :place_opening_time_4,
                  :place_phone_number, :place_email, :place_image_url
    
  validates :place_name, :presence => true, :length => 1..255
  validates :place_lat, :presence => true, :length => 1..255
  validates :place_log, :presence => true, :length => 1..255
  validates :place_address, :presence => true, :length => 1..255
  validates :place_phone_number, :presence => true, :length => 1..255
  validates :place_email, :presence => true, :length => 1..255
  validates :place_image_url, :presence => true, :length => 1..255

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :place_email, format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
end
