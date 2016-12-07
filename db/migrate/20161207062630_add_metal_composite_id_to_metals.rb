class AddMetalCompositeIdToMetals < ActiveRecord::Migration
  def change
    add_column :metals, :metal_composite_id, :integer
  end
end
