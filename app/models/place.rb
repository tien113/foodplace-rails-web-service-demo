class Place < ActiveRecord::Base
  
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

  validates_uniqueness_of :place_email
  validates_format_of :place_email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                                    :message => "Invalid email"
    
  has_many :foods
end
