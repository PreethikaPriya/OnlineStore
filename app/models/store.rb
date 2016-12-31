class Store < ActiveRecord::Base
validates_presence_of  :name, :ph_num, :tags, :region_id
validates :ph_num,:presence => true,
             :numericality => true,
             :length => { :minimum => 10, :maximum => 15}
validates_uniqueness_of :ph_num

# has_many :region_stores
# has_many :regions, through: :region_stores

has_many :store_regions
has_many :regions, through: :store_regions

def self.search_result(region)
	region = region.downcase.gsub(/\s+/, "")
 # Store.where('name LIKE?', "%#{region}") 
 	stores = Store.all
 	@stores = Array.new
  stores.each do |store|
  	if (Region.find(store.region_id).region.downcase.gsub(/\s+/, "") == region)
  		@stores.push(store)
  	end	
 	end
  return @stores
end
end
