class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :stores, :ph_num ,:string
  end
end
