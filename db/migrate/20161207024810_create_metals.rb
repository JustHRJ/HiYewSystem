class CreateMetals < ActiveRecord::Migration
  def change
    create_table :metals do |t|
      t.string :name
      t.string :metal_code
      t.timestamps
    end
  end
end
