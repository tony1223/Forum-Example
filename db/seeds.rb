# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

u = User.new( :login => "admin" , 
             :password => "techbang" , 
             :password_confirmation=>"techbang" ,
             :email => "admin@www.techbang.com.tw" )
             
u.is_admin = true
u.save

puts u.inspect
