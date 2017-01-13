class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :invoice_no
      t.float :amount
      t.belongs_to :customer
      t.date :payment_date

      t.timestamps null: false
    end
  end
end
