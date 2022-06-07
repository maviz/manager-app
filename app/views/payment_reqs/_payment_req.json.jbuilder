json.extract! payment_req, :id, :status, :amount, :transaction_id, :description, :currency, :created_at, :updated_at
json.url payment_req_url(payment_req, format: :json)
