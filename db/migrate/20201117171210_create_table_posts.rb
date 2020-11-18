class CreateTablePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.date :date_added
      t.boolean :is_public
      t.integer :votes, array: true # Summing the number of elements gives vote number. Array contains voter's user id.
      t.integer :user_id
    end
  end
end
