class CreateMetalCategories < ActiveRecord::Migration
  def change
    create_table :metal_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
