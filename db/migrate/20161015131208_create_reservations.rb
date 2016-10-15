class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :concert_id
      t.integer :nb_people
      t.integer :total_price

      t.timestamps
    end
  end
end
