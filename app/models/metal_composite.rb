class MetalComposite < ActiveRecord::Base
   has_one :metal, dependent: :destroy
    
end