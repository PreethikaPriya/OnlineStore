class Store < ActiveRecord::Base
validates_presence_of  :name, :ph_num, :tags
validates :ph_num,:presence => true,
             :numericality => true,
             :length => { :minimum => 10, :maximum => 15}
validates_uniqueness_of :ph_num

def self.search_result(region)
  Store.where('name LIKE?', "%#{region}") 
end

end
