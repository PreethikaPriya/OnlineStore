class Region < ActiveRecord::Base
validates_presence_of :region
has_many :zipcodes
has_many :stores

end
