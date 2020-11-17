class CreateTableUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :reputation # Adds or subtracts 1 for every vote.
    end
  end
end
