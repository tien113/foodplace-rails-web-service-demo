class Order < ActiveRecord::Base
  
  attr_accessible :order_uuid, :order_total, :order_date, 
                  :order_done, :order_details_attributes
                  
  has_many :order_details, :dependent => :delete_all
  accepts_nested_attributes_for :order_details
  
  validates :order_uuid, length: 1..255
  validates :order_total, length: 1..8
  validates :order_date, length: 1..255
  validates :order_details, presence: true
  
end
