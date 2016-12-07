class MetalCategory < ActiveRecord::Base
   has_many :metal_metal_categories
   has_many :metals, through: :metal_metal_categories
end