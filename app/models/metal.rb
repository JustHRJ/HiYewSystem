class Metal < ActiveRecord::Base
    has_many :metal_metal_categories
    has_many :metal_categories, through: :metal_metal_categories
    belongs_to :metal_composite
    
    validates :name, presence:true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    validates :metal_code, presence: true, uniqueness: {case_sensitive: false}
end