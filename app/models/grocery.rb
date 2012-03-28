class Grocery < ActiveRecord::Base
  belongs_to :list
  has_many :purchases
  
  attr_accessible :grocery_name, :unit_increment, :unit, :upc_code, :current_amount, :unit_of_time_estimated
  
  attr_accessor :number_of_days
  
end
