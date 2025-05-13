require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "バリデーション" do
    it "有効なファクトリを持つこと" do
      like = build(:like)
      expect(like).to be_valid
    end

    it "同じユーザーが同じ投稿に2回いいねできないこと" do
      user = create(:user)
      post = create(:post, user: user)
      create(:like, user: user, post: post)

      duplicate_like = build(:like, user: user, post: post)
      expect(duplicate_like).to_not be_valid
      expect(duplicate_like.errors.details[:user_id].first).to include(error: :taken)
    end
  end

  describe "アソシエーション" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
