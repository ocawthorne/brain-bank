class CreateTableVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :post_id
      t.integer :voter_id
    end
  end
end
