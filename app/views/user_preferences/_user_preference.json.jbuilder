json.extract! user_preference, :id, :user_id, :style_id, :order, :created_at, :updated_at
json.url user_preference_url(user_preference, format: :json)