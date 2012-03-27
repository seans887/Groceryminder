class List < ActiveRecord::Base
  belongs_to :user
  has_many :groceries
  
  attr_accessible :list_name
end
