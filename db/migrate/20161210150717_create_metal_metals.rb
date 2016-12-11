class CreateMetalMetals < ActiveRecord::Migration
  def change
    create_table :metal_metals do |t|
      t.integer :metal_associator_id
      t.integer :metal_associating_id
    end
  end
end
