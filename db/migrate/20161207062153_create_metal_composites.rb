class CreateMetalComposites < ActiveRecord::Migration
  def change
    create_table :metal_composites do |t|
      t.float :iron
      t.float :calcium
      t.float :potassium
      t.float :others
      
      t.timestamps
    end
  end
end
