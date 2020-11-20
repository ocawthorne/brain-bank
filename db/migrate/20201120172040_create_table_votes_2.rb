class CreateTableVotes2 < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :score
    end
  end
end
