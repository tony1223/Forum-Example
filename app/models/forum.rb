class Forum < ActiveRecord::Base
   has_many :posts
   cattr_reader :per_page
    @@per_page = 10
   
end
