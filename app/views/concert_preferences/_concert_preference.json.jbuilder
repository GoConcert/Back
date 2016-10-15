json.extract! concert_preference, :id, :concert_id, :style_id, :order, :created_at, :updated_at
json.url concert_preference_url(concert_preference, format: :json)