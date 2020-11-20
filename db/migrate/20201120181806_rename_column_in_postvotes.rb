class RenameColumnInPostvotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :postvotes, :voter_id, :user_id
  end
end
