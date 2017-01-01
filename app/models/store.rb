class Store < ActiveRecord::Base
#attr_accessible :addresses_attributes

validates_presence_of  :name, :ph_num, :tags, :region_id, :zipcode_id
validates :ph_num,:presence => true,
             :numericality => true,
             :length => { :minimum => 10, :maximum => 15}
validates_uniqueness_of :ph_num

# has_many :region_stores
# has_many :regions, through: :region_stores

# has_many :store_regions
# has_many :regions, through: :store_regions

belongs_to :zipcode
belongs_to :region
has_many :addresses
accepts_nested_attributes_for :addresses , allow_destroy: true , reject_if: lambda {|attributes| attributes['kind'].blank?}

def self.search_result(region)
	# binding.pry
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
