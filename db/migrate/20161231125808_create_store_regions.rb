class CreateStoreRegions < ActiveRecord::Migration
  def change
    create_table :store_regions do |t|
      t.integer :store_id
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
