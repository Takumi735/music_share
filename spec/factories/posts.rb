FactoryBot.define do
  factory :post do
    association :user

    spotify_track_id { Faker::Music::GratefulDead.song }
    song_title { Faker::Music.album }
    artist_name { Faker::Music.band }
    content { Faker::Lorem.sentence(word_count: 10) }
  end
end
