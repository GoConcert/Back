class CreateConcertPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :concert_preferences do |t|
      t.integer :concert_id
      t.integer :style_id
      t.integer :order

      t.timestamps
    end
  end
end
