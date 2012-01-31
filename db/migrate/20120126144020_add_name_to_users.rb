class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :fullname, :string
  end
end
