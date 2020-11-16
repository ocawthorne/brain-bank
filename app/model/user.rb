#! A User has many posts.
#! A User has many followers.

class User < ActiveRecord::Base
   has_secure_password
   has_many :posts
   has_many :followers
end
