class CreateMetalMetalCategories < ActiveRecord::Migration
  def change
    create_table :metal_metal_categories do |t|
      t.integer :metal_id
      t.integer :metal_category_id
    end
  end
end
