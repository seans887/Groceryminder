# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Grocery.create(:list_id => 8, :grocery_name => 'Milk', :unit_increment => 1.00, :unit => 'gallon', :current_amount => 0.50, :use_per_day => 0.20)