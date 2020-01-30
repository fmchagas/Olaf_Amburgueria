json.extract! customer, :id, :name, :cpf, :phone, :email, :address, :number, :district, :zip, :city, :state, :created_at, :updated_at
json.url customer_url(customer, format: :json)
