class CreateRegionStores < ActiveRecord::Migration
  def change
    create_table :region_stores do |t|
      t.integer :region_id
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
