class Order < ActiveRecord::Base
  belongs_to :member
  belongs_to :driver  
end
