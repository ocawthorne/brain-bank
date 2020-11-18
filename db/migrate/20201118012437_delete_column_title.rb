class DeleteColumnTitle < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title
  end
end
