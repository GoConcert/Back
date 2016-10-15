json.extract! reservation, :id, :user_id, :concert_id, :nb_people, :total_price, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)