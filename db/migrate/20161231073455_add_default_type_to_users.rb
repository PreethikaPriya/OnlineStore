class AddDefaultTypeToUsers < ActiveRecord::Migration
  def change
  	
  	rename_column :users, :role_id, :role
  	change_column :users, :role ,:string
  	change_column_default(:users, :role, "admin")
  end
end
