class Address < ActiveRecord::Base
	belongs_to :store
	validates_presence_of :street1, :street2
end
