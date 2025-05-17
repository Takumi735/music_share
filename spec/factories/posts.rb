FactoryBot.define do
  factory :post do
    association :user

    spotify_track_id { "5LkWXxDxUTwEVHL0pfKL55" }
    song_title { "Pretender" }
    artist_name { "Official髭男dism" }
    content { Faker::Lorem.sentence(word_count: 10) }
  end
end
