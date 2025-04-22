class Post < ApplicationRecord
  belongs_to :user

  validates :spotify_track_id, presence: true
  validates :song_title, presence: true
  validates :artist_name, presence: true
  validates :content, length: { maximum: 100 }
end
