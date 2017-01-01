class AddZipcodeIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :zipcode_id, :integer
  end
end
