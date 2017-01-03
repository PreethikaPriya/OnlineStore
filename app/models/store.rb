class Store < ActiveRecord::Base
acts_as_taggable 

validates_presence_of  :name , :region_id, :zipcode_id, :tag_list
validates :ph_num,:presence => true,
             :numericality => true,
             :length => { :minimum => 10, :maximum => 15}
validates_uniqueness_of :ph_num

belongs_to :zipcode
belongs_to :region
has_many :addresses
accepts_nested_attributes_for :addresses, allow_destroy: true

def self.search_result(region)
	region = region.downcase.gsub(/\s+/, "")
 # Store.where('name LIKE?', "%#{region}") 

 	stores = Store.all
 	@stores = Array.new
  	stores.each do |store| 	
	  	if ((store.region.region.downcase.gsub(/\s+/, "") == region) || (store.zipcode.zipcode == region))
	  		@stores.push(store)
	  	end	
 	end
  return @stores
end
end
