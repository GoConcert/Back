json.extract! user, :id, :user_name, :email, :password, :first_name, :last_name, :location, :created_at, :updated_at
json.url user_url(user, format: :json)