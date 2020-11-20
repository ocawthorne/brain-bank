class RenameVotesToPostvotes < ActiveRecord::Migration[5.2]
  def change
    rename_table :votes, :postvotes
  end
end
