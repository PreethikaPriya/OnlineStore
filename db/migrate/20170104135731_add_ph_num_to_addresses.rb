class AddPhNumToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :ph_num, :string
  end
end
