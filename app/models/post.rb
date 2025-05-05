class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :spotify_track_id, presence: true
  validates :song_title, presence: true
  validates :artist_name, presence: true
  validates :content, length: { maximum: 100 }
end
