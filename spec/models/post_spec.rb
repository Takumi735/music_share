require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    it "有効なファクトリを持つこと" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "spotify_track_idがないと無効であること" do
      post = build(:post, spotify_track_id: nil)
      expect(post).not_to be_valid
    end

    it "song_titleがないと無効であること" do
      post = build(:post, song_title: nil)
      expect(post).not_to be_valid
    end

    it "artist_nameがないと無効であること" do
      post = build(:post, artist_name: nil)
      expect(post).not_to be_valid
    end

    it "contentが300文字を超えると無効であること" do
      post = build(:post, content: "あ" * 301)
      expect(post).not_to be_valid
      expect(post.errors.details[:content]).to include(error: :too_long, count: 300)
    end
  end

  describe "アソシエーション" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:liked_users).through(:likes).source(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
