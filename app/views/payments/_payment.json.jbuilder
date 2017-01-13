json.extract! payment, :id, :invoice_no, :amount, :belongs_to, :payment_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)