#! Upvote and downvote
#! Can be seen by other users but users can only edit their own entry.

#! A Post belongs to a User.

class Post < ActiveRecord::Base
   belongs_to :user
end
