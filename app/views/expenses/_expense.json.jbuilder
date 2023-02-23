json.extract! group_expense, :id, :name, :amount, :created_at, :updated_at
json.url group_expense_url(group_expense, format: :json)
