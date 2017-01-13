json.extract! customer, :id, :name, :address1, :address2, :postal_code, :contact_number, :limit, :created_at, :updated_at
json.url customer_url(customer, format: :json)