class Grocery < ActiveRecord::Base
  belongs_to :list
  has_many :purchases
end
