class Forum < ActiveRecord::Base
   has_many :posts,:dependent => :destroy
   cattr_reader :per_page
    @@per_page = 10
   
end
