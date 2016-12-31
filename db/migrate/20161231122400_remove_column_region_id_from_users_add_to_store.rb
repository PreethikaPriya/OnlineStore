class RemoveColumnRegionIdFromUsersAddToStore < ActiveRecord::Migration
  def change
  	remove_column :users, :region_id
  	add_column :stores, :region_id, :integer
  end
end
