class AddAddressIdToStore < ActiveRecord::Migration
  def change
    add_column :stores, :address_id, :integer
  end
end
