class CreateMusicStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :music_styles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
