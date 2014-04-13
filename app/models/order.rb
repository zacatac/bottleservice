class Order < ActiveRecord::Base
  belongs_to :member
  has_one :driver  
end
