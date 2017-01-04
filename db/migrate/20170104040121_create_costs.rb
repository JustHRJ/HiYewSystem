class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :description
      t.float :cost
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
