class Grocery < ActiveRecord::Base
  belongs_to :list
  has_many :purchases
  
  attr_accessible :grocery_name, :unit_increment, :unit, :upc_code, :current_amount, :use_per_day_estimate
end
