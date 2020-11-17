# The number of times that a User is followed, i.e. shows up in the user_id_followed column, will show as the number of followers.

class CreateTableFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :user_id_followed  # The User being followed will have this displayed on a profile.
      t.integer :user_id_following # The following User will see posts from Users they have followed.
    end
  end
end
