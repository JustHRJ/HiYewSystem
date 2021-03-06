class Metal < ActiveRecord::Base
    has_many :metal_metal_categories
    has_many :metal_categories, through: :metal_metal_categories
    belongs_to :metal_composite
    
    
    has_many :metal_associate, foreign_key: :metal_associating_id, class_name: "MetalMetal"
    has_many :metal_associates, through: :metal_associate, source: :metal_associator
    
    has_many :metal_associatings, foreign_key: :metal_associator_id, class_name: "MetalMetal"
    has_many :metal_associate_to, through: :metal_associatings, source: :metal_associating
    
    
    validates :name, presence:true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    validates :metal_code, presence: true, uniqueness: {case_sensitive: false}
    
    
    
    def self.search_by_name(param)
        return Metal.none if param.blank?
        param.strip!
        param.downcase!
        (name_matches(param)).uniq        
    end
    
    
    def self.name_matches(param)
        matches('name', param)
    end
    
    def self.matches(field_name, param)
        where("lower(#{field_name}) like ?", "%#{param}%")
    end
end