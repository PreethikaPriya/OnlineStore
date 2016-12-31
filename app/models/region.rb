class Region < ActiveRecord::Base
# has_many :region_stores
# has_many :stores, through: :region_stores

has_many :store_regions
has_many :stores, through: :store_regions
end
