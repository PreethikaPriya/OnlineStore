class Zipcode < ActiveRecord::Base
belongs_to :region
has_many :stores
validates_presence_of :zipcode, :region_id
end
