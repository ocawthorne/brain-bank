class CreateTablePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.date :date_added
      t.bool :is_public
      t.integer :votes
    end
  end
end
