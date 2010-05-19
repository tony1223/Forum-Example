class Post < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  cattr_reader :per_page
   @@per_page = 10
  
end
