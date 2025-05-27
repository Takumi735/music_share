class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :spotify_track_id
      t.string :song_title
      t.string :artist_name
      t.string :album_name

      t.timestamps
    end
  end
end
