class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :zipcode
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
