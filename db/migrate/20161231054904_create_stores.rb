class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :ph_num
      t.string :website
      t.string :tags

      t.timestamps null: false
    end
  end
end
