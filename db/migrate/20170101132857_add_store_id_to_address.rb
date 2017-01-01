class AddStoreIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :store_id, :integer
  end
end
