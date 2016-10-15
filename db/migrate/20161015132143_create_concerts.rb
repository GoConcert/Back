class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :location
      t.string :description
      t.integer :capacity
      t.integer :price
      t.string :image
      t.date :date

      t.timestamps
    end
  end
end
