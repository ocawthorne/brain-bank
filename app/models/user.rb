class User < ActiveRecord::Base
   has_many :posts
   has_many :votes, through: :postvotes
   has_many :followers #! Currently unused.

   has_secure_password

   def slug
      username.downcase.gsub(" ","-")
   end

end
