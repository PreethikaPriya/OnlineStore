class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.integer :region_id
      t.integer :zipcode_id

      t.timestamps null: false
    end
  end
end
