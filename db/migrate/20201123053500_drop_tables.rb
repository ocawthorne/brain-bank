class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :followers
    drop_table :postvotes
    drop_table :votes
  end
end
