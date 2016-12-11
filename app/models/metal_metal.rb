class MetalMetal < ActiveRecord::Base
    belongs_to :metal_associator, foreign_key: :metal_associator_id, class_name: "Metal"
    belongs_to :metal_associating, foreign_key: :metal_associating_id, class_name: "Metal"
end