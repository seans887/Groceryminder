class Purchase < ActiveRecord::Base
  belongs_to :grocery
  
  attr_accessible :purchase_date, :purchase_amount, :unit_price
end
