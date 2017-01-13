class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :contact_number
      t.float :limit

      t.timestamps null: false
    end
  end
end
